//
//  TabBarManager+SetNavigationController.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension TabbarManager {
    func setNav(VC: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController.init(rootViewController: VC)
        //===titleLogoView===
        
        /*   let imagek = AppImages.TitleNav.resizeImage(newSize: CGSize.init(width: 114, height: 38))
         let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 114, height: 38))
         imageView.image = imagek
         imageView.contentMode = .scaleAspectFit
         VC.navigationItem.titleView = imageView
         */
        return nav
    }
}
