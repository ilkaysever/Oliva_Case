//
//  CoreDataManager.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import CoreData

final class CoreDataManager {
    
    enum CoreDataError: Error {
        case failedToSave
        case failedFetchData
        case faildToDeleteData
    }
    
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        
    }
    
    func saveCoreData(model: Product, completion: @escaping (Result<Void, Error>) -> Void) {
        if let productId = model.productID {
            getSingleData(productId: productId) { [self] result in
                switch result {
                case .success(let favoriteModel):
                    deleteCoreDataByCoreDataModel(model: favoriteModel) { result in
                        switch result {
                        case .success():
                            self.createNewFavoriteModel(model: model) { result in
                                switch result {
                                case .success():
                                    completion(.success(()))
                                case .failure(_):
                                    completion(.failure(CoreDataError.failedToSave))
                                }
                            }
                        case .failure(_):
                            completion(.failure(CoreDataError.failedToSave))
                        }
                    }
                case .failure(_):
                    self.createNewFavoriteModel(model: model) { result in
                        switch result {
                        case .success():
                            completion(.success(()))
                        case .failure(_):
                            completion(.failure(CoreDataError.failedToSave))
                        }
                    }
                }
            }
        }
    }
    
    private func createNewFavoriteModel(model: Product, completion: @escaping (Result<Void, Error>) -> Void) {
        let context = AppDelegate.shared.persistentContainer.viewContext
        let favoriteModel = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: context)
        
        favoriteModel.setValue(UUID(), forKey: "id")
        favoriteModel.setValue(model.productID, forKey: "productID")
        favoriteModel.setValue(model.displayName, forKey: "displayName")
        favoriteModel.setValue(model.actualPriceToShowOnScreenText, forKey: "price")
        favoriteModel.setValue(model.imageURL, forKey: "imageURL")
        
        do {
            try context.save()
            completion(.success(()))
            print(favoriteModel)
        } catch {
            completion(.failure(CoreDataError.failedToSave))
        }
    }
    
    func fetchCoreData(completion: @escaping (Result<[Favorite], Error>)-> Void){
        let context = AppDelegate.shared.persistentContainer.viewContext
        let request : NSFetchRequest<Favorite>
        request = Favorite.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let products = try context.fetch(request)
            completion(.success(products))
        } catch {
            completion(.failure(CoreDataError.failedFetchData))
        }
    }
    
    func getSingleData(productId: Int, completion: @escaping (Result<Favorite, Error>)-> Void){
        let context = AppDelegate.shared.persistentContainer.viewContext
        let request : NSFetchRequest<Favorite>
        request = Favorite.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let product = try context.fetch(request).filter({$0.productID == productId}).first
            if let product = product {
                completion(.success(product))
            } else {
                completion(.failure(CoreDataError.failedFetchData))
            }
        } catch {
            completion(.failure(CoreDataError.failedFetchData))
        }
    }
    
    func deleteCoreDataByCoreDataModel(model: Favorite, completion: @escaping (Result<Void, Error>)-> Void) {
        let context = AppDelegate.shared.persistentContainer.viewContext
        context.delete(model)
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(CoreDataError.faildToDeleteData))
        }
    }
    
    func deleteCoreDataByProductId(productId: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        getSingleData(productId: productId) { result in
            switch result {
            case .success(let favoriteModel):
                self.deleteCoreDataByCoreDataModel(model: favoriteModel) { result in
                    switch result {
                    case .success():
                        completion(.success(()))
                    case .failure(_):
                        completion(.failure(CoreDataError.faildToDeleteData))
                    }
                }
            case .failure(_):
                completion(.failure(CoreDataError.faildToDeleteData))
            }
        }
    }
    
}
