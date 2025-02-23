//
//  NetworkHelper.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

enum ErrorType: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Inlavid Url"
    case unknownError = "An error unknown"
}

struct Constants {
    static let baseUrl = "https://www.beymen.com/Mobile2/api/mbproduct/"
}

final class NetworkHelper {
    
    static let shared = NetworkHelper()
    
}
