//
//  HomeViewModel.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import Foundation

protocol ProductViewModelProtocol {
    func productListRequest(page: String)
    func productCount() -> Int
    func productArrayList() -> [Product]
    func totalPageCount() -> Int
    func loadMoreProducts()
    func changeListType()
    func toggleFavorite(for productId: Int, isFavorite: Bool)
}

class ProductViewModel: BaseViewModel, ProductViewModelProtocol {
    
    enum ListType: Int, CaseIterable {
        case list
        case collection
    }
    
    private var productData: ProductResponseModel?
    private var productResult: ProductResult?
    private var productList: [Product] = []
    var productDetail: Product?
    
    var currentPage = 1
    var totalPages = 0
    var selectedProductId = 0
    var listType: ListType = .collection
    
    override init() {
        super.init()
    }
    
    func productListRequest(page: String = "1") {
        ProductListRequest.shared.allProductRequest(page: page) { [weak self] data in
            guard let self = self else { return }
            if let data = data, let result = data.result {
                self.productData = data
                self.productResult = result
                self.productList += result.productList ?? []
                self.totalPages = result.totalPageCount ?? 0
                self.handleSuccess()
            } else {
                self.handleFailure(error: ErrorType.invalidData.rawValue)
            }
        }
    }
    
    func productCount() -> Int {
        return productList.count
    }
    
    func productArrayList() -> [Product] {
        return productList
    }
    
    func totalPageCount() -> Int {
        return totalPages
    }
    
    func loadMoreProducts() {
        guard currentPage < totalPages else { return }
        currentPage += 1
        productListRequest(page: "\(currentPage)")
    }
    
    func changeListType() {
        listType = (listType == .list) ? .collection : .list
    }
    
    func toggleFavorite(for productId: Int, isFavorite: Bool) {
        if var product = productList.first(where: { $0.productID == productId }) {
            product.isFavorite = isFavorite
            if isFavorite {
                CoreDataManager.shared.saveCoreData(model: product) { result in
                    switch result {
                    case .success():
                        NotificationCenter.default.post(name: NSNotification.Name("favorited"), object: nil)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            } else {
                CoreDataManager.shared.deleteCoreDataByProductId(productId: productId) { result in
                    switch result {
                    case .success():
                        NotificationCenter.default.post(name: NSNotification.Name("favorited"), object: nil)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
    
}
