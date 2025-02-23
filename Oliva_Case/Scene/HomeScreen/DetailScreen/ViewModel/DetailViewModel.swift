//
//  DetailViewModel.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import Foundation

protocol DetailViewModelProtocol {
    func productDetail(productId: Int)
    func likeProduct(productItem: Product?)
    func unlikeProduct(productId: Int?)
}

final class DetailViewModel: BaseViewModel, DetailViewModelProtocol {
    
    var productDetail: ProductDetail?
    var selectedProductId = 0
    
    override init() {
        super.init()
    }
    
    func productDetail(productId: Int) {
        ProductDetailRequest.shared.productDetailRequest(productId: productId) { [weak self] data in
            guard let self = self else { return }
            if let data = data {
                self.productDetail = data.result
                self.handleSuccess()
            } else {
                self.handleFailure(error: ErrorType.invalidData.rawValue)
            }
        }
    }
    
    func likeProduct(productItem: Product?) {
        guard let productItem = productItem else { return }
        CoreDataManager.shared.saveCoreData(model: productItem) { result in
            switch result {
            case .success():
                NotificationCenter.default.post(name: NSNotification.Name("favorited"), object: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func unlikeProduct(productId: Int?) {
        guard let productId = productId else { return }
        CoreDataManager.shared.deleteCoreDataByProductId(productId: productId) { result in
            switch result {
            case .success():
                NotificationCenter.default.post(name: NSNotification.Name("favorited"), object: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
