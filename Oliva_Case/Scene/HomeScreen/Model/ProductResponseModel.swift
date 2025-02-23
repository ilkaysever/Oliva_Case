//
//  ProductResponseModel.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//


struct ProductResponseModel: Codable {
    var success: Bool?
    var message: String?
    var result: ProductResult?
    var isOriginFromCheckout: Bool?
    
    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case message = "Message"
        case result = "Result"
        case isOriginFromCheckout = "IsOriginFromCheckout"
    }
}

// MARK: - Result
struct ProductResult: Codable {
    var productList: [Product]?
    var orderOption: String?
    var totalItemCount: Int?
    var totalPageCount: Int?
    var category: String?
    var categoryID: Int?
    var list: String?
    
    enum CodingKeys: String, CodingKey {
        case productList = "ProductList"
        case orderOption = "OrderOption"
        case totalItemCount = "TotalItemCount"
        case totalPageCount = "TotalPageCount"
        case category = "Category"
        case categoryID = "CategoryId"
        case list = "List"
    }
}

struct Product: Codable {
    var productID: Int?
    var externalSystemCode: String?
    var displayName: String?
    var description: Description?
    var brandName: String?
    var imageURL: String?
    var imageUrls: [String]?
    var strikeThroughPriceToShowOnScreenText: String?
    var strikeThroughPriceToShowOnScreen: Double?
    var actualPriceToShowOnScreenText: String?
    var actualPriceToShowOnScreen: Double?
    var isStrikeThroughPriceExists: Bool?
    var discountRate: Int?
    var price: Double?
    var cdnResizedImageURL: String?
    var secondPrice: Int?
    var showDefaultDiscountRate: Bool?
    var newDiscountRate: Int?
    var isOutOfStock: Bool?
    var color: String?
    var standartSize: String?
    var isFavorite: Bool? = false
    
    enum CodingKeys: String, CodingKey {
        case productID = "ProductId"
        case externalSystemCode = "ExternalSystemCode"
        case displayName = "DisplayName"
        case description = "Description"
        case brandName = "BrandName"
        case imageURL = "ImageUrl"
        case imageUrls = "ImageUrls"
        case strikeThroughPriceToShowOnScreenText = "StrikeThroughPriceToShowOnScreenText"
        case strikeThroughPriceToShowOnScreen = "StrikeThroughPriceToShowOnScreen"
        case actualPriceToShowOnScreenText = "ActualPriceToShowOnScreenText"
        case actualPriceToShowOnScreen = "ActualPriceToShowOnScreen"
        case isStrikeThroughPriceExists = "IsStrikeThroughPriceExists"
        case discountRate = "DiscountRate"
        case price = "Price"
        case cdnResizedImageURL = "CdnResizedImageUrl"
        case secondPrice = "SecondPrice"
        case showDefaultDiscountRate = "ShowDefaultDiscountRate"
        case newDiscountRate = "NewDiscountRate"
        case isOutOfStock = "IsOutOfStock"
        case color = "Color"
        case standartSize = "StandartSize"
        case isFavorite
    }
}

// MARK: - SizeList
struct SizeList: Codable {
    var sizeName: String?
    var inStock: Bool?
    var variantID: Int?
    
    enum CodingKeys: String, CodingKey {
        case sizeName = "SizeName"
        case inStock = "InStock"
        case variantID = "VariantId"
    }
}
