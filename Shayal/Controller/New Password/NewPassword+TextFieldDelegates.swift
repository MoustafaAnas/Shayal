//
//  NewPassword+TextFieldDelegates.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension NewPasswordVC: UITextFieldDelegate {
    
    // MARK: - Setup TextField
    func setupTextField() {
        newPasswordTxtField.setPadding()
        confirmNewPasswordTxtField.setPadding()
        
        newPasswordTxtField.delegate = self
        confirmNewPasswordTxtField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textFieldTracer()
       }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setPadding()
    }
}
