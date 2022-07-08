//
//  WhoAreWeVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 28/06/2022.
//

import UIKit

final class WhoAreWeVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var whoAreWeContentLbl: UILabel!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Who Are We".localized()
        navigationItem.backButtonTitle = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Custom Functions
    func localized() {
        whoAreWeContentLbl.text = "Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text Example Text".localized()
    }

}
