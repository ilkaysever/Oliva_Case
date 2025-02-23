//
//  BaseTabbarController.swift
//  Oliva_Case
//
//  Created by İlkay SEVER (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    private func configureTabBar() {
        view.backgroundColor = AppColors.tabBarColor
        tabBar.backgroundColor = AppColors.tabBarColor
        tabBar.isTranslucent = false
        tabBar.barTintColor = AppColors.tabBarColor
        tabBar.tintColor = AppColors.white
        tabBar.unselectedItemTintColor = UIColor.lightGray
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Ubuntu-Medium", size: 10)!], for: .normal)
    }
    
}
