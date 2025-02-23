//
//  ProductDetailRequest.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import Foundation

final class ProductDetailRequest {
    
    static let shared = ProductDetailRequest()
    
    func productDetailRequest(productId: Int, completion: @escaping (ProductDetailModel?) -> ()) {
        
        guard let url = URL(string: "\(Constants.baseUrl)product?productid=\(productId)") else { return }
        
        NetworkManager.shared.request(type: ProductDetailModel.self, url: url, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                completion(data)
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
}
