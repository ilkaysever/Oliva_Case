//
//  ProductListRequest.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import Foundation

final class ProductListRequest {
    
    static let shared = ProductListRequest()
    
    func allProductRequest(page: String?, completion: @escaping (ProductResponseModel?) -> ()) {
        guard let page = page else { return }
        guard let url = URL(string: "\(Constants.baseUrl)list?siralama=akillisiralama&sayfa=\(page)&categoryId=10020&includeDocuments=true") else { return }
        
        NetworkManager.shared.request(type: ProductResponseModel.self, url: url, method: .get) { [weak self] response in
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
