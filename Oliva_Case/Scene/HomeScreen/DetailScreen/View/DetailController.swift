//
//  DetailController.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import UIKit

protocol DetailControllerDelegate: AnyObject {
    func didUpdateFavoriteStatus(productId: Int, isFavorite: Bool)
}

final class DetailController: BaseViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var viewModel = DetailViewModel()
    
    var productId = 0
    var isFavorite: Bool = false
    var productItem: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle(title: productItem?.brandName)
        setupBinding()
    }
    
    private func setupUI(productItem: ProductDetail?) {
        imgView.setImageUrl(imageUrl: productItem?.images?.first?.images?.first?.imageURL ?? "")
        brandLabel.text = productItem?.brandName
        titleLabel.text = productItem?.displayName
        priceLabel.text = productItem?.actualPriceText
        descLabel.attributedText = productItem?.description?.özellikler?.htmlToAttributedString(withTextColor: AppColors.white)
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
    
    private func setupBinding() {
        DispatchQueue.main.async {
            self.fetchProductList()
        }
    }
    
    private func fetchProductList() {
        viewModel.productDetail(productId: productId)
        viewModel.didSuccess = {
            self.setupUI(productItem: self.viewModel.productDetail)
        }
        viewModel.didFailure = { error in
            print(error)
        }
    }
    
    private func configureLikeButton(isFavorite: Bool) {
        if isFavorite {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        isFavorite = !isFavorite
        if isFavorite {
            viewModel.likeProduct(productItem: productItem)
        } else {
            viewModel.unlikeProduct(productId: productId)
        }
        configureLikeButton(isFavorite: isFavorite)
    }
    
}
