//
//  String+Ext.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import UIKit

extension String {
    func htmlToAttributedString(withTextColor color: UIColor) -> NSAttributedString? {
        guard let data = self.data(using: .utf8) else { return nil }
        do {
            let attributedString = try NSMutableAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html,
                          .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil
            )
            
            let range = NSRange(location: 0, length: attributedString.length)
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
            
            attributedString.addAttribute(.font, value: AppFonts.UbuntuRegular16, range: range)
            
            return attributedString
        } catch {
            print("HTML conversion error:", error)
            return nil
        }
    }
}

