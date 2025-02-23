//
//  ProductCollectionCell.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import UIKit

protocol ProductCollectionDelegate: AnyObject {
    func didTappedLike(productId: Int?, isFavorite: Bool)
}

final class ProductCollectionCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var isFavorite: Bool = false
    var productItem: Product?
    
    weak var delegate: ProductCollectionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.numberOfLines = 0
        containerView.addCornerRadius(radius: 8)
    }
    
    func configureProductCard(_ productModel: Product?, isFavorite: Bool?, _ delegate: ProductCollectionDelegate) {
        guard let imgUrl = productModel?.imageURL,
              let title = productModel?.displayName,
              let productId = productModel?.productID else { return }
        self.delegate = delegate
        productImg.setImageUrl(imageUrl: imgUrl)
        titleLabel.text = title
        configureLikeButton(productId: productId)
    }
    
    private func configureLikeButton(productId: Int) {
        CoreDataManager.shared.getSingleData(productId: productId) { [weak self] result in
            switch result {
            case .success(_):
                self?.isFavorite = true
                self?.configureLikeButton(isFavorite: true)
            case .failure(_):
                self?.isFavorite = false
                self?.configureLikeButton(isFavorite: false)
            }
        }
    }
    
    private func configureLikeButton(isFavorite: Bool) {
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func favoriteTapped(_ sender: Any) {
        if let productItem = productItem {
            let isFavorite = !self.isFavorite
            let productId = productItem.productID
            delegate?.didTappedLike(productId: productId, isFavorite: isFavorite)
            configureLikeButton(isFavorite: isFavorite)
        }
    }
    
}
