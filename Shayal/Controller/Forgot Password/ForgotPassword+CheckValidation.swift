//
//  ForgotPassword+CheckValidation.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit
import ANActivityIndicator
import FTIndicator

extension ForgotPasswordVC {
    
    func checkPhoneNumberValidation() {
        guard let phoneNumber = phoneNumberTxtField.text, !phoneNumber.isEmpty, phoneNumber.count == 11, phoneNumber.isValidPhone() else {
            phoneNumberTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            presentInvalidPhoneNumberLbl(present: true)
            return
        }
        
        showIndicator(message: "Loading...".localized(), messageTopMargin: 20, animationType: .ballRotateChase)
            phoneNumberTxtField.backgroundColor = AppColor.textFieldBackground
            presentInvalidPhoneNumberLbl(present: false)
            FTIndicator.showSuccess(withMessage: "Verification code has been sent to the number you entered".localized())
            hideIndicator()
            navigationController?.pushViewController(ActivationCodeVC(), animated: true)
    }
    
    func presentInvalidPhoneNumberLbl(present: Bool) {
        UIView.animate(withDuration: 0.3) {
            if present {
                self.invalidPhoneNumberLbl.alpha = 1
                }
            else {
                self.invalidPhoneNumberLbl.alpha = 0
            }
        }
    }
}
