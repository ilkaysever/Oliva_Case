//
//  FavoriteController.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import UIKit

final class FavoriteController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noFavoriteLabel: UILabel!
    
    private let viewModel = FavoriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView()
        bindViewModel()
        viewModel.fetchFavoritedProduct()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(fetchFavoritedProduct), name: NSNotification.Name("favorited"), object: nil)
    }
    
    private func setupUI() {
        navigationTitle(title: "Favoriler")
    }
    
    private func bindViewModel() {
        viewModel.didSuccess = { [weak self] in
            self?.handleFavoritesUpdate()
        }
        viewModel.didFailure = { [weak self] error in
            self?.handleError(error)
        }
    }
    
    @objc func fetchFavoritedProduct() {
        viewModel.fetchFavoritedProduct()
    }
    
    private func handleFavoritesUpdate() {
        if viewModel.favoriteData.isEmpty {
            noFavoriteLabel.isHidden = false
            tableView.isHidden = true
        } else {
            noFavoriteLabel.isHidden = true
            tableView.isHidden = false
        }
        tableView.reloadData()
    }
    
    private func handleError(_ error: String) {
        debugPrint(error)
    }
    
    private func deleteProductFromFavorite(indexPath: IndexPath) {
        viewModel.deleteProductFromFavorites(at: indexPath.row)
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 0
        tableView.register(FavoriteTableCell.self)
    }
    
}

extension FavoriteController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoriteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FavoriteTableCell.self), for: indexPath) as? FavoriteTableCell else { return UITableViewCell() }
        cell.configureFavoriteCell(viewModel.favoriteData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteProductFromFavorite(indexPath: indexPath)
        }
    }
    
}
