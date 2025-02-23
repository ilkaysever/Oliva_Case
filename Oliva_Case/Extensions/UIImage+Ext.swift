//
//  UIImage+Ext.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import Kingfisher
import UIKit

extension UIImageView {
    
    func setImageUrl(imageUrl: String) {
        if let url = URL(string: ((imageUrl))) {
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url, placeholder: UIImage(named: "empty_news"))
        }
    }
    
}
