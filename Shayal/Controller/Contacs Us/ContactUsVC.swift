//
//  ContactUsVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 28/04/2022.
//

import UIKit

final class ContactUsVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var landLineNumberLbl: UILabel!
    @IBOutlet weak var whatsupNumberLbl: UILabel!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contact Us".localized()
        navigationItem.backButtonTitle = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
    }

}
