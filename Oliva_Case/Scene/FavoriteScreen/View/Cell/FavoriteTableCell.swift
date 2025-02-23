//
//  FavoriteTableCell.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import UIKit

final class FavoriteTableCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        imgView.addCornerRadius(radius: 8)
    }
    
    func configureFavoriteCell(_ favoriteData: Favorite?) {
        guard let imgUrl = favoriteData?.imageURL,
              let title = favoriteData?.displayName,
              let price = favoriteData?.price else { return }
        imgView.setImageUrl(imageUrl: imgUrl)
        titleLabel.text = title
        priceLabel.text = price
    }
    
}
