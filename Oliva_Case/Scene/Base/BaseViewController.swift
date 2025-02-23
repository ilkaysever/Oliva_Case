//
//  BaseViewController.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.backButtonTitle = ""
        view.backgroundColor = AppColors.backgroundColor
        view.alpha = 1.0
    }
    
    func navigationTitle(title: String?) {
        guard let title = title else { return }
        navigationItem.title = title
    }
    
    func addRightButton(selector: Selector? = nil, image: String? = nil)  {
            let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
            imageview.image = UIImage(named: "\(image ?? "")")
            imageview.contentMode = .center
            imageview.isUserInteractionEnabled = true
            imageview.addCornerRadius(radius: 8)
            imageview.tintColor = AppColors.white
            
            let rightButton = UIBarButtonItem(customView: imageview)
            let tapGesture = UITapGestureRecognizer(target: self, action: selector)
            navigationItem.rightBarButtonItem = rightButton
            rightButton.customView?.addGestureRecognizer(tapGesture)
    }
    
}
