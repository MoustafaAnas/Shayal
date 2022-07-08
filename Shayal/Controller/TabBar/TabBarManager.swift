//
//  TabBarManager.swift
//  Shayal
//
//  Created by Moustafa Anas on 26/04/2022.
//

import UIKit

final class TabbarManager: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarItems()
        self.tabBar.tintColor = AppColor.mainColor
        tabBar.backgroundColor = UIColor.white
        delegate = self
        tabBar.layer.shadowOffset = CGSize(width:0, height:0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 1
    }

    func setupTabbarItems(){
        
        let home = HomeVC()
        home.tabBarItem = UITabBarItem(title: "Home".localized(),
                                       image: UIImage(systemName: "house.fill"),
                                       selectedImage: UIImage(systemName: "house.fill"))
        
        let myOrders = MyOrdersVC()
        myOrders.tabBarItem = UITabBarItem(title: "My Orders".localized(),
                                           image: UIImage(named: "myOrders"),
                                         selectedImage: UIImage(named: "myOrders"))
        
        let chat = ChatVC()
        chat.tabBarItem = UITabBarItem(title: "Chat".localized(),
                                                image: UIImage(systemName: "message.fill"),
                                                selectedImage: UIImage(systemName: "message.fill"))
        
        
        let more = MoreVC()
        more.tabBarItem = UITabBarItem(title: "More".localized(),
                                       image: UIImage(systemName: "ellipsis"),
                                       selectedImage: UIImage(systemName: "ellipsis"))
        

        
            viewControllers = [setNav(VC: home),
                               setNav(VC: myOrders),
                               setNav(VC: chat),
                               setNav(VC: more)]
        
        //        if UserDefaults.standard.bool(forKey: "driver"){
        //            viewControllers = [setNav(VC: driverHome),
        //                               setNav(VC: driverOrders),
        //                               setNav(VC: notifications),
        //                               setNav(VC: more)]
        //        }else{
        //        }
        
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let barButtonView = item.value(forKey: "view") as? UIView else { return }
        let animationLength: TimeInterval = 0.4
        let propertyAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.5) {
            barButtonView.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
        }
        propertyAnimator.addAnimations({ barButtonView.transform = .identity }, delayFactor: CGFloat(animationLength))
        propertyAnimator.startAnimation()
    }
}


