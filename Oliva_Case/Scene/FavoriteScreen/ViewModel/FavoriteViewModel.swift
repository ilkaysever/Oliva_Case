//
//  FavoriteViewModel.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 24.02.2025.
//

import Foundation

protocol FavoriteViewModelProtocol {
    func fetchFavoritedProduct()
    func deleteProductFromFavorites(at index: Int)
}

final class FavoriteViewModel: BaseViewModel, FavoriteViewModelProtocol {
    
    var favoriteData: [Favorite] = []
    
    override init() {
        super.init()
    }
    
    func fetchFavoritedProduct() {
        CoreDataManager.shared.fetchCoreData { [weak self] result in
            switch result {
            case .success(let products):
                self?.favoriteData = products
                self?.handleSuccess()
            case .failure(let error):
                self?.handleFailure(error: error.localizedDescription)
            }
        }
    }
    
    func deleteProductFromFavorites(at index: Int) {
        CoreDataManager.shared.deleteCoreDataByCoreDataModel(model: favoriteData[index]) { [weak self] result in
            switch result {
            case .success():
                self?.favoriteData.remove(at: index)
                self?.handleSuccess()
            case .failure(let error):
                self?.handleFailure(error: error.localizedDescription)
            }
        }
    }
    
}
