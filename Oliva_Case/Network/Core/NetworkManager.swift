//
//  NetworkManager.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Codable>(type: T.Type, url: URL, method: HTTPMethod, completion: @escaping((Result<T, ErrorType>) -> ())) {
        AF.request(url, method: method).response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    self.handleResponse(data: data) { response in
                        completion(response)
                    }
                } else {
                    completion(.failure(.unknownError))
                }
            case .failure(_):
                completion(.failure(.unknownError))
            }
        }
    }
    
    private func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorType>) -> ())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
    
}
