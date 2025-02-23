//
//  BaseViewModel.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import Foundation

class BaseViewModel {
    
    public var didSuccess: () -> Void = { }
    public var didFailure: (String) -> Void = { _ in }
    
    init() {
        
    }
    
    func handleSuccess() {
        self.didSuccess()
    }
    
    func handleFailure(error: String) {
        self.didFailure(error)
    }
    
}
