//
//  ProductDetailModel.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productDetailModel = try? JSONDecoder().decode(ProductDetailModel.self, from: jsonData)

import Foundation

// MARK: - ProductDetailModel
struct ProductDetailModel: Codable {
    var success: Bool?
    var message: JSONNull?
    var result: ProductDetail?
    var exception: JSONNull?
    var isOriginFromCheckout: Bool?

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case message = "Message"
        case result = "Result"
        case exception = "Exception"
        case isOriginFromCheckout = "IsOriginFromCheckout"
    }
}

// MARK: - Result
struct ProductDetail: Codable {
    var productID: Int?
    var externalSystemCode, displayName: String?
    var description: Description?
    var estimatedSupplyDate: JSONNull?
    var brandName, actualPriceText: String?
    var actualPrice: Int?
    var isStrikeThroughPriceExist: Bool?
    var strikeThroughPriceText: String?
    var strikeThroughPrice: Int?
    var discountRateText: String?
    var isVatIncluded: Bool?
    var vatRate: Int?
    var hasHopiParacik: Bool?
    var hopiParacikText: JSONNull?
    var isPreOrder, hasQuantitySelector, isCosmeticProduct, isBanned: Bool?
    var isGiftCard, isAppWidgetNotShown: Bool?
    var images: [ResultImage]?
    var otherColorList: [JSONAny]?
    var tagAttributes: JSONNull?
    var installment: Installment?
    var contentURL: ContentURL?
    var categoryLink, brandLink: Link?
    var shareURL: String?
    var sizeSystem: String?
    var gtmModel: GtmModel?
    var categoryID: Int?
    var categoryName, breadcrumbCategory, list: String?
    var seller: Seller?
    var maxProductQuantityCanSold: Int?
    var isFavorite: Bool? = false

    enum CodingKeys: String, CodingKey {
        case productID = "ProductId"
        case externalSystemCode = "ExternalSystemCode"
        case displayName = "DisplayName"
        case description = "Description"
        case estimatedSupplyDate = "EstimatedSupplyDate"
        case brandName = "BrandName"
        case actualPriceText = "ActualPriceText"
        case actualPrice = "ActualPrice"
        case isStrikeThroughPriceExist = "IsStrikeThroughPriceExist"
        case strikeThroughPriceText = "StrikeThroughPriceText"
        case strikeThroughPrice = "StrikeThroughPrice"
        case discountRateText = "DiscountRateText"
        case isVatIncluded = "IsVatIncluded"
        case vatRate = "VatRate"
        case hasHopiParacik = "HasHopiParacik"
        case hopiParacikText = "HopiParacikText"
        case isPreOrder = "IsPreOrder"
        case hasQuantitySelector = "HasQuantitySelector"
        case isCosmeticProduct = "IsCosmeticProduct"
        case isBanned = "IsBanned"
        case isGiftCard = "IsGiftCard"
        case isAppWidgetNotShown = "IsAppWidgetNotShown"
        case images = "Images"
        case otherColorList = "OtherColorList"
        case tagAttributes = "TagAttributes"
        case installment = "Installment"
        case contentURL = "ContentUrl"
        case categoryLink = "CategoryLink"
        case brandLink = "BrandLink"
        case shareURL = "ShareUrl"
        case sizeSystem = "SizeSystem"
        case gtmModel = "GtmModel"
        case categoryID = "CategoryId"
        case categoryName = "CategoryName"
        case breadcrumbCategory = "BreadcrumbCategory"
        case list = "List"
        case seller = "Seller"
        case maxProductQuantityCanSold = "MaxProductQuantityCanSold"
        case isFavorite
    }
}

// MARK: - Link
struct Link: Codable {
    var url: String?
    var displayName: String?

    enum CodingKeys: String, CodingKey {
        case url = "Url"
        case displayName = "DisplayName"
    }
}

// MARK: - ContentURL
struct ContentURL: Codable {
    var delivery, shipment, oneCard, sizeChartURL: String?
    var shipmentAndDelivery, preOwnedStatus: JSONNull?

    enum CodingKeys: String, CodingKey {
        case delivery = "Delivery"
        case shipment = "Shipment"
        case oneCard = "OneCard"
        case sizeChartURL = "SizeChartUrl"
        case shipmentAndDelivery = "ShipmentAndDelivery"
        case preOwnedStatus = "PreOwnedStatus"
    }
}

// MARK: - Description
struct Description: Codable {
    var özellikler, yılSezon, kumaşVeBakım, ürünKodu: String?

    enum CodingKeys: String, CodingKey {
        case özellikler = "Özellikler :"
        case yılSezon = "Yıl Sezon :"
        case kumaşVeBakım = "Kumaş ve Bakım :"
        case ürünKodu = "Ürün Kodu"
    }
}

// MARK: - GtmModel
struct GtmModel: Codable {
    var pseas, pgen, pdsct, pother: String?
    var pmaingroup, pproductgroup, pconsignment: String?
    var pyear: JSONNull?

    enum CodingKeys: String, CodingKey {
        case pseas = "Pseas"
        case pgen = "Pgen"
        case pdsct = "Pdsct"
        case pother = "Pother"
        case pmaingroup = "Pmaingroup"
        case pproductgroup = "Pproductgroup"
        case pconsignment = "Pconsignment"
        case pyear = "Pyear"
    }
}

// MARK: - ResultImage
struct ResultImage: Codable {
    var displayOrder: Int?
    var images: [ImageImage]?

    enum CodingKeys: String, CodingKey {
        case displayOrder = "DisplayOrder"
        case images = "Images"
    }
}

// MARK: - ImageImage
struct ImageImage: Codable {
    var sizeCode: SizeCode?
    var imageURL: String?

    enum CodingKeys: String, CodingKey {
        case sizeCode = "SizeCode"
        case imageURL = "ImageUrl"
    }
}

enum SizeCode: String, Codable {
    case cdnResize = "cdn-resize"
    case original = "original"
}

// MARK: - Installment
struct Installment: Codable {
    var installmentWarningText: JSONNull?
    var hasInstallmentWarning: Bool?
    var url: String?
    var installmentCount: Int?

    enum CodingKeys: String, CodingKey {
        case installmentWarningText = "InstallmentWarningText"
        case hasInstallmentWarning = "HasInstallmentWarning"
        case url = "Url"
        case installmentCount = "InstallmentCount"
    }
}

// MARK: - Seller
struct Seller: Codable {
    var sellerName, sellerTitle: String?
    var sellerCode: JSONNull?

    enum CodingKeys: String, CodingKey {
        case sellerName = "SellerName"
        case sellerTitle = "SellerTitle"
        case sellerCode = "SellerCode"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
            return nil
    }

    required init?(stringValue: String) {
            key = stringValue
    }

    var intValue: Int? {
            return nil
    }

    var stringValue: String {
            return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
            return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
            return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                    return value
            }
            if let value = try? container.decode(Int64.self) {
                    return value
            }
            if let value = try? container.decode(Double.self) {
                    return value
            }
            if let value = try? container.decode(String.self) {
                    return value
            }
            if container.decodeNil() {
                    return JSONNull()
            }
            throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                    return value
            }
            if let value = try? container.decode(Int64.self) {
                    return value
            }
            if let value = try? container.decode(Double.self) {
                    return value
            }
            if let value = try? container.decode(String.self) {
                    return value
            }
            if let value = try? container.decodeNil() {
                    if value {
                            return JSONNull()
                    }
            }
            if var container = try? container.nestedUnkeyedContainer() {
                    return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
                    return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
            if let value = try? container.decode(Bool.self, forKey: key) {
                    return value
            }
            if let value = try? container.decode(Int64.self, forKey: key) {
                    return value
            }
            if let value = try? container.decode(Double.self, forKey: key) {
                    return value
            }
            if let value = try? container.decode(String.self, forKey: key) {
                    return value
            }
            if let value = try? container.decodeNil(forKey: key) {
                    if value {
                            return JSONNull()
                    }
            }
            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
                    return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
                    return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
            var arr: [Any] = []
            while !container.isAtEnd {
                    let value = try decode(from: &container)
                    arr.append(value)
            }
            return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
            var dict = [String: Any]()
            for key in container.allKeys {
                    let value = try decode(from: &container, forKey: key)
                    dict[key.stringValue] = value
            }
            return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
            for value in array {
                    if let value = value as? Bool {
                            try container.encode(value)
                    } else if let value = value as? Int64 {
                            try container.encode(value)
                    } else if let value = value as? Double {
                            try container.encode(value)
                    } else if let value = value as? String {
                            try container.encode(value)
                    } else if value is JSONNull {
                            try container.encodeNil()
                    } else if let value = value as? [Any] {
                            var container = container.nestedUnkeyedContainer()
                            try encode(to: &container, array: value)
                    } else if let value = value as? [String: Any] {
                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                            try encode(to: &container, dictionary: value)
                    } else {
                            throw encodingError(forValue: value, codingPath: container.codingPath)
                    }
            }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
            for (key, value) in dictionary {
                    let key = JSONCodingKey(stringValue: key)!
                    if let value = value as? Bool {
                            try container.encode(value, forKey: key)
                    } else if let value = value as? Int64 {
                            try container.encode(value, forKey: key)
                    } else if let value = value as? Double {
                            try container.encode(value, forKey: key)
                    } else if let value = value as? String {
                            try container.encode(value, forKey: key)
                    } else if value is JSONNull {
                            try container.encodeNil(forKey: key)
                    } else if let value = value as? [Any] {
                            var container = container.nestedUnkeyedContainer(forKey: key)
                            try encode(to: &container, array: value)
                    } else if let value = value as? [String: Any] {
                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                            try encode(to: &container, dictionary: value)
                    } else {
                            throw encodingError(forValue: value, codingPath: container.codingPath)
                    }
            }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
            if let value = value as? Bool {
                    try container.encode(value)
            } else if let value = value as? Int64 {
                    try container.encode(value)
            } else if let value = value as? Double {
                    try container.encode(value)
            } else if let value = value as? String {
                    try container.encode(value)
            } else if value is JSONNull {
                    try container.encodeNil()
            } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
            }
    }

    public required init(from decoder: Decoder) throws {
            if var arrayContainer = try? decoder.unkeyedContainer() {
                    self.value = try JSONAny.decodeArray(from: &arrayContainer)
            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
                    self.value = try JSONAny.decodeDictionary(from: &container)
            } else {
                    let container = try decoder.singleValueContainer()
                    self.value = try JSONAny.decode(from: container)
            }
    }

    public func encode(to encoder: Encoder) throws {
            if let arr = self.value as? [Any] {
                    var container = encoder.unkeyedContainer()
                    try JSONAny.encode(to: &container, array: arr)
            } else if let dict = self.value as? [String: Any] {
                    var container = encoder.container(keyedBy: JSONCodingKey.self)
                    try JSONAny.encode(to: &container, dictionary: dict)
            } else {
                    var container = encoder.singleValueContainer()
                    try JSONAny.encode(to: &container, value: self.value)
            }
    }
}
