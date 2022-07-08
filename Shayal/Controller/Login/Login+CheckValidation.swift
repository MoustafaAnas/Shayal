//
//  Login+CheckValidation.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension LoginVC {
    
    func checkPhoneNumberValidation() -> Bool {
        guard let phoneNumber = phoneNumberTxtField.text, !phoneNumber.isEmpty, phoneNumber.count == 11, phoneNumber.isValidPhone() else {
            phoneNumberTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            UIView.animate(withDuration: 0.3) {
                self.invalidPhoneNumberHeight.constant = 12
                self.invalidPhoneNumberLbl.alpha = 1
            }

            return false
        }
        
        phoneNumberTxtField.backgroundColor = AppColor.textFieldBackground
            UIView.animate(withDuration: 0.3) {
            self.invalidPhoneNumberHeight.constant = 0
            self.invalidPhoneNumberLbl.alpha = 0
        }
        return true
    }
    
    
    func checkPasswordValidation() -> Bool {
        guard let password = passwordTxtField.text, !password.isEmpty, password.count > 5 else {
            passwordTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            UIView.animate(withDuration: 0.3) {
                self.incorrectPasswordLbl.alpha = 1
            }
            return false
        }
        
        passwordTxtField.backgroundColor = AppColor.textFieldBackground
            UIView.animate(withDuration: 0.3) {
            self.incorrectPasswordLbl.alpha = 0
        }
        return true
    }
}
