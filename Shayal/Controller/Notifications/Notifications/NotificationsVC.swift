//
//  NotificationsVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 02/07/2022.
//

import UIKit

final class NotificationsVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var notificationsTV: UITableView!
    
    var notificationsCellItem = [NotificationsDataModel]()
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Notifications".localized()
        navigationItem.backButtonTitle = ""
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        customizeNavBar(navBarimage: "NavBarBackground", navBarTintColor: .white, titleColor: .white)
        
        noDataToDisplayMsgWithImage(tableview: notificationsTV, tableViewDataArrCount: notificationsCellItem.count,image: "bell.slash.fill", tintColor: .lightGray, msg: "No new notifications yet".localized())
    }

}


