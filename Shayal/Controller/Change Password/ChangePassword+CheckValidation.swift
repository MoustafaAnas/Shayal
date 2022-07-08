//
//  ChangePassword+CheckValidation.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import Foundation
import FTIndicator
import ANActivityIndicator

extension ChangePasswordVC {
    
    // MARK: - Check New Password Validation
    func checkNewPasswordValidation() {
        if  checkPasswordValidation() && checkConfirmPasswordValidation() {
            showIndicator(message: "Loading...".localized(), messageTopMargin: 20, animationType: .ballRotateChase)
            dismiss(animated: true)
            hideIndicator()
            FTIndicator.showSuccess(withMessage: "Password Changed Successfully".localized())
        }
    }
    
    func checkPasswordValidation() -> Bool {
        guard let password = newPasswordTxtField.text, !password.isEmpty else{
            newPasswordTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Enter your new password".localized())
            return false
        }
        
        if password.count < 5 {
        newPasswordTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Enter valid new password".localized())
        return false
    }
        newPasswordTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
    
    func checkConfirmPasswordValidation() -> Bool {
        guard let confirmPassword = confirmNewPasswordTxtField.text, !confirmPassword.isEmpty else{
            confirmNewPasswordTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Enter Confirm Password".localized())
            return false
        }
            if confirmPassword != newPasswordTxtField.text {
            confirmNewPasswordTxtField.backgroundColor = AppColor.inValidTextFieldBackground
                FTIndicator.showToastMessage("Confirm Password does not match your password".localized())
            return false
        }
        confirmNewPasswordTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
}
