//
//  ReportsVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 29/04/2022.
//

import UIKit

final class ReportsVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var reportsTV: UITableView!
    
    var reportsCellItem = [String]()
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reports".localized()
        navigationItem.backButtonTitle = ""
        
        customAddReportBtn()
        setupTableView()
    }


    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
    }

    // MARK: - Custom Functions
    func customAddReportBtn() {
        let addReportBtn = UIBarButtonItem()
        addReportBtn.image = UIImage(systemName: "plus")
        addReportBtn.action = #selector(addReportBtnIsPressed)
        addReportBtn.target = self
        navigationItem.rightBarButtonItem = addReportBtn
    }
    
    // Add Report Button Action
   @objc func addReportBtnIsPressed () {
       let addReportVC = AddReportVC()
       addReportVC.view.backgroundColor = UIColor.clear
       addReportVC.view.isOpaque = false
       addReportVC.modalPresentationStyle = .overCurrentContext
       self.present(addReportVC, animated: true)
    }
}

