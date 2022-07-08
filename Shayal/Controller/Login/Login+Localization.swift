//
//  Login+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import Foundation
import UIKit

extension LoginVC {
    func localized() {
        
        welcomeLbl.text = "Welcome To Shayal App".localized()
        loginBenefitsLbl.text = "Please login to save your search result and your orders and surely for more fun!".localized()
        invalidPhoneNumberLbl.text = "Phone Number is invalid".localized()
        incorrectPasswordLbl.text = "Incorrect Password".localized()
        signupByLbl.text = "Sign up By".localized()
        dontHaveAccountLbl.text = "Don't Have Account?".localized()
        loginBtn.setTitle("Login".localized(), for: .normal)
        signupAsDeliveryBtn.setTitle("Sign up as Delivery".localized(), for: .normal)
    }
}

