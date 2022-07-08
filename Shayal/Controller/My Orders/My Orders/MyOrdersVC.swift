//
//  MyOrdersVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 26/04/2022.
//

import UIKit
import AnimatableReload

final class MyOrdersVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var myOrdersTV: UITableView!
    @IBOutlet weak var orderStateSegmentControl: CustomSegmentedControl!
    
    var pendingOrdersCellItems = [PendingOrdersModel]()
    var ordersCellItems = [OrdersModel]()
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "My Orders".localized()
        navigationItem.backButtonTitle = ""
        
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        customizeNavBar(navBarimage: "NavBarBackground", navBarTintColor: .white, titleColor: .white)
        
        setupSegmentControl()
    }

   
}




