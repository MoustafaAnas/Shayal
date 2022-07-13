//
//  ForgotPasswordVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 22/04/2022.
//

import UIKit

final class ForgotPasswordVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var enterPhoneNumberLbl: UILabel!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var invalidPhoneNumberLbl: UILabel!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "Forgot Password".localized()
        navigationItem.backButtonTitle = ""
        
        setupTextField()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupInterfaceDesign()
    }
    
    override func viewDidLayoutSubviews() {
        nextBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
    }
    
    // MARK: - Buttons Actions
    @IBAction func nextBtnPressed(_ sender: Any) {
        checkPhoneNumberValidation()
    }
    
    // MARK: - Custom Functions
    func setupInterfaceDesign() {
        navigationController?.isNavigationBarHidden = false
        phoneNumberTxtField.placeHolderColor(color: .white)
        nextBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        phoneNumberTxtField.text = ""
        phoneNumberTxtField.becomeFirstResponder()
    }
}


