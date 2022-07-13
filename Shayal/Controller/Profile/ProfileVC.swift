//
//  ProfileVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 29/04/2022.
//

import UIKit

class ProfileVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var deliveryCount: UILabel!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var phoneNumberTitleLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var countryTitleLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile".localized()
        navigationItem.backButtonTitle = ""
        balanceLbl.text = "100 " + "S.R".localized()
        customEditProfileBtn()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        customizeNavigationBar()
    }
    
    // MARK: - Customize Functions
    func customizeNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.tintColor = .white
    }
    
    func customEditProfileBtn() {
        let editProfileBtn = UIBarButtonItem()
        editProfileBtn.image = UIImage(systemName: "pencil")
        editProfileBtn.action = #selector(editProfileBtnIsPressed)
        editProfileBtn.target = self
        navigationItem.rightBarButtonItem = editProfileBtn
    }
    
    // Edit Button Action
   @objc func editProfileBtnIsPressed () {
       navigationController?.pushViewController(EditProfileVC(), animated: true)
    }
}

