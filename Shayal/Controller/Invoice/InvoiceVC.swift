//
//  InvoiceVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 28/04/2022.
//

import UIKit

final class InvoiceVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var deliveryGuyImg: UIImageView!
    @IBOutlet weak var deliveryGuyName: UILabel!
    @IBOutlet weak var finalCostLbl: UILabel!
    @IBOutlet weak var finalCostMoneyLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Invoice".localized()
        navigationItem.backButtonTitle = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        nextBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        nextBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
    }

    // MARK: - Buttons Actions
    @IBAction func nextBtnPressed(_ sender: Any) {
        let payMethodVC = PayMethodVC()
        payMethodVC.view.backgroundColor = UIColor.clear
        payMethodVC.view.isOpaque = false
        payMethodVC.modalPresentationStyle = .overCurrentContext
        payMethodVC.modalTransitionStyle = .crossDissolve
        self.present(payMethodVC, animated: true)
    }
}
