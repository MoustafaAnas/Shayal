//
//  ChatVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 26/04/2022.
//

import UIKit

final class ChatVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var chatTV: UITableView!
    
    var chatCellItem = [ChatDataModel]()
    let refreshControl = UIRefreshControl()
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "Chat".localized()
        navigationItem.backButtonTitle = ""
        
        setupTableView()
        refreshControlPulled()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        customizeNavBar(navBarimage: "NavBarBackground", navBarTintColor: .white, titleColor: .white)
        
        noDataToDisplayMsg(tableview: chatTV, tableViewDataArrCount: chatCellItem.count, tintColor: .lightGray, msg: "Empty".localized())
    }
    
    // MARK: - Custom Functions
    func refreshControlPulled() {
        refreshControl.tintColor = AppColor.mainColor
        refreshControl.addTarget(self, action: #selector(refreshVC), for: .valueChanged)
        chatTV.addSubview(refreshControl)
    }
    
    @objc func refreshVC() {
        refreshControl.endRefreshing()
        self.chatTV.reloadData()
    }
}

