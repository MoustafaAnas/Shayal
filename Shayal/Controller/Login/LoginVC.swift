//
//  LoginVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 21/04/2022.
//

import UIKit
import SafariServices

final class LoginVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var loginBenefitsLbl: UILabel!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signupAsDeliveryBtn: UIButton!
    @IBOutlet weak var invalidPhoneNumberLbl: UILabel!
    @IBOutlet weak var invalidPhoneNumberHeight: NSLayoutConstraint!
    @IBOutlet weak var incorrectPasswordLbl: UILabel!
    @IBOutlet weak var signupByLbl: UILabel!
    @IBOutlet weak var dontHaveAccountLbl: UILabel!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        localized()
        setupTextField()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupInterfaceDesign()
    }
    
    // MARK: - Buttons Actions
    @IBAction func forgotPasswordBtnIsPressed(_ sender: Any) {
        navigationController?.pushViewController(ForgotPasswordVC(), animated: true)
    }
    
    @IBAction func loginBtnIsPressed(_ sender: Any) {
        if checkPhoneNumberValidation() && checkPasswordValidation() {
            view.endEditing(true)
            loginApi(phoneNumber: phoneNumberTxtField.text!, Password: passwordTxtField.text!)
        }
    }
    
    @IBAction func signupBtnIsPressed(_ sender: Any) {
        navigationController?.pushViewController(RegisterVC(), animated: true)
    }
    
    @IBAction func signupAsDeliveryBtnIsPressed(_ sender: Any) {
        guard let url = URL(string: "https://www.apple.com/eg-ar/app-store/") else {return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @IBAction func signupByFacebookBtnPressed(_ sender: Any) {
    }
    
    @IBAction func signupByGoogleBtnPressed(_ sender: Any) {
    }
    
    @IBAction func signupByTwitterBtnPressed(_ sender: Any) {
    }
  
}





