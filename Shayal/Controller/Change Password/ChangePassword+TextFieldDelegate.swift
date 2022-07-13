//
//  ChangePassword+TextFieldDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import UIKit
import IQKeyboardManagerSwift

extension ChangePasswordVC: UITextFieldDelegate {
    
    // MARK: - Setup TextField
    func setupTextField() {
        IQKeyboardManager.shared.enable = false
        newPasswordTxtField.setPadding()
        confirmNewPasswordTxtField.setPadding()
        
        newPasswordTxtField.delegate = self
        confirmNewPasswordTxtField.delegate = self
        
        newPasswordTxtField.placeHolderColor(color: .white)
        confirmNewPasswordTxtField.placeHolderColor(color: .white)
        
        newPasswordTxtField.backgroundColor = AppColor.textFieldBackground
        confirmNewPasswordTxtField.backgroundColor = AppColor.textFieldBackground
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = AppColor.textFieldBackground
        textField.textFieldTracer()
        IQKeyboardManager.shared.enable = true
       }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setPadding()
        IQKeyboardManager.shared.enable = false
    }
}
