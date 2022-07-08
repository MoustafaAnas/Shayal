//
//  Login+CodeDesgin.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension LoginVC {
    
    // MARK: - Setup Design
    func setupInterfaceDesign() {
        navigationController?.isNavigationBarHidden = true
        
        forgotPasswordBtn.underline(text: "Forgot Password?".localized())
        signupBtn.underline(text: "Sign up".localized())
        loginBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        
        phoneNumberTxtField.attributedPlaceholder = NSAttributedString(string: "Phone Number".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: "Password".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        addBtnToTextField(textField: passwordTxtField, img: UIImage(systemName: "eye.fill")!, tintColor: UIColor.white)
        passwordTxtField.isSecureTextEntry = true
        customizeNavigationBar()
        
        phoneNumberTxtField.backgroundColor = AppColor.textFieldBackground
        passwordTxtField.backgroundColor = AppColor.textFieldBackground
        
        phoneNumberTxtField.text = ""
        passwordTxtField.text = ""
        
        invalidPhoneNumberLbl.alpha = 0
        invalidPhoneNumberHeight.constant = 0
        incorrectPasswordLbl.alpha = 0
    }
    
    
    override func viewDidLayoutSubviews() {
        forgotPasswordBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 12)
        loginBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
//        signupBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 12)
        signupAsDeliveryBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 13)
    }
    
    // NavigationBar Customization
    func customizeNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.tintColor = .white
    }
    
    // Add Hide Password Button To PasswordTextField
    func addBtnToTextField(textField: UITextField, img: UIImage, tintColor: UIColor) {
        let button = UIButton(frame: CGRect(x: 10, y: (textField.frame.height)/2 - 15 , width: 30, height: 30))
        button.setImage(img, for: .normal)
        button.tintColor = tintColor
        button.addTarget(self, action: #selector(hidePasswordBtnIsPressed), for: .touchUpInside)
        textField.rightViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: textField.frame.height))
        view.addSubview(button)
        textField.rightView = view
    }
    
    // TextField Button Action
    @objc func hidePasswordBtnIsPressed(_ sender: Any) {
        if passwordTxtField.isSecureTextEntry {
            addBtnToTextField(textField: passwordTxtField, img: UIImage(systemName: "eye.slash.fill")!, tintColor: UIColor.lightGray)
        passwordTxtField.isSecureTextEntry = false
        } else {
            addBtnToTextField(textField: passwordTxtField, img: UIImage(systemName: "eye.fill")!, tintColor: UIColor.white)
            passwordTxtField.isSecureTextEntry = true
        }
    }
}
