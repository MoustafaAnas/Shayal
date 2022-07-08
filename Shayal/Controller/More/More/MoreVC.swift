//
//  MoreVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 26/04/2022.
//

import UIKit

final class MoreVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var moreTV: UITableView!
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    
    var moreCellItems = [MoreDataModel]()
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "More".localized()
        navigationItem.backButtonTitle = ""
        localized()
        setupGestureRecognizerAction()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = false
        
        customizeNavBar(navBarimage: "NavBarBackground", navBarTintColor: .white, titleColor: .white)
    }
    
    // MARK: - Buttons Actions
    @IBAction func logOutBtnPressed(_ sender: Any) {
        let logoutVC = LogoutVC()
        logoutVC.view.backgroundColor = UIColor.clear
        logoutVC.view.isOpaque = false
        logoutVC.modalPresentationStyle = .overFullScreen
        self.present(logoutVC, animated: true)
    }
    
    // MARK: - Custom Functions
    
    // Setup Gesture
    func setupGestureRecognizerAction() {
        userProfileImg.addGestureRecognizer(customizeProfileAction())
        userNameLbl.addGestureRecognizer(customizeProfileAction())
    }
    
    // Create Gesture
    func customizeProfileAction() -> UIGestureRecognizer {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goToProfileAction))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        return gesture
    }
    // Gesture Action
    @objc func goToProfileAction() {
        navigationController?.pushViewController(ProfileVC(), animated: true)
    }
}
