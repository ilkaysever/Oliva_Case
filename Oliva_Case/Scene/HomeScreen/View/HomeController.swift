//
//  HomeController.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import UIKit

final class HomeController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCollectionView()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupBinding()
    }
    
    private func setupUI() {
        navigationTitle(title: "Ana Sayfa")
        addRightButton(selector: #selector(changeListType), image: "list_icon")
    }
    
    private func setupBinding() {
        viewModel.productListRequest()
        viewModel.didSuccess = {
            self.collectionView.reloadData()
        }
        viewModel.didFailure = { error in
            print(error)
        }
    }
    
    @objc func changeListType() {
        viewModel.changeListType()
        let image = viewModel.listType == .list ? "table_icon" : "list_icon"
        addRightButton(selector: #selector(changeListType), image: image)
        self.collectionView.reloadData()
    }
    
    private func configureCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        self.collectionView.collectionViewLayout = layout
        
        self.collectionView.register(ProductCollectionCell.self)
    }
    
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.productCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCollectionCell.self), for: indexPath) as! ProductCollectionCell
        let product = viewModel.productArrayList()[indexPath.row]
        cell.productItem = product
        cell.configureProductCard(product, isFavorite: product.isFavorite, self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProductId = viewModel.productArrayList()[indexPath.row].productID ?? 0
        let controller = DetailController()
        controller.productId = selectedProductId
        controller.isFavorite = viewModel.productArrayList()[indexPath.row].isFavorite ?? false
        controller.productItem = viewModel.productArrayList()[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch viewModel.listType {
        case .list:
            let width = (UIScreen.main.bounds.width) - 24
            let height = width / 1.5
            return CGSize(width: width, height: height)
        case .collection:
            let width = (UIScreen.main.bounds.width / 2) - 24
            let height = width * 1.6
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.productCount() - 1, viewModel.currentPage < viewModel.totalPages {
            viewModel.loadMoreProducts()
        }
    }
    
}

extension HomeController: ProductCollectionDelegate {
    
    func didTappedLike(productId: Int?, isFavorite: Bool) {
        guard let productId = productId else { return }
        viewModel.toggleFavorite(for: productId, isFavorite: isFavorite)
    }
    
}
