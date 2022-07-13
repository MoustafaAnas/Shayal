//
//  TermsAndConditionsVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 28/04/2022.
//

import UIKit

final class TermsAndConditionsVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var termsAndConditionsContentLbl: UILabel!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Terms and Conditions".localized()
        navigationItem.backButtonTitle = ""
        localized()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Custom Functions
    func localized() {
        termsAndConditionsContentLbl.text = "Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text".localized()
    }

}
