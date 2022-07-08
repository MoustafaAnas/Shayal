//
//  Register+TextFieldDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit
import IQKeyboardManagerSwift

extension RegisterVC: UITextFieldDelegate {
    
    // MARK: - Setup TextFields
    func setupTextField() {
       
        nameTxtField.attributedPlaceholder = NSAttributedString(string: "Name".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        phoneNumberTxtField.attributedPlaceholder = NSAttributedString(string: "Phone Number".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        countryTxtField.attributedPlaceholder = NSAttributedString(string: "Country".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        cityTxtField.attributedPlaceholder = NSAttributedString(string: "City".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: "Password".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        confirmPasswordTxtField.attributedPlaceholder = NSAttributedString(string: "Confirm Password".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        nameTxtField.setPadding()
        phoneNumberTxtField.setPadding()
        countryTxtField.setPadding()
        cityTxtField.setPadding()
        passwordTxtField.setPadding()
        confirmPasswordTxtField.setPadding()
        
        countryTxtField.addRightIcon(icon: UIImage(named: "down-filled-arrow")!, tintColor: .white)
        cityTxtField.addRightIcon(icon: UIImage(named: "down-filled-arrow")!, tintColor: .white)
        
        nameTxtField.backgroundColor = AppColor.textFieldBackground
        phoneNumberTxtField.backgroundColor = AppColor.textFieldBackground
        countryTxtField.backgroundColor = AppColor.textFieldBackground
        cityTxtField.backgroundColor = AppColor.textFieldBackground
        passwordTxtField.backgroundColor = AppColor.textFieldBackground
        confirmPasswordTxtField.backgroundColor = AppColor.textFieldBackground
        
        nameTxtField.delegate = self
        phoneNumberTxtField.delegate = self
        countryTxtField.delegate = self
        cityTxtField.delegate = self
        passwordTxtField.delegate = self
        confirmPasswordTxtField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
        if textField == countryTxtField {
            pickerViewArr = countryPickerViewArr
        }
        
        else if textField == cityTxtField {
            pickerViewArr = cityPickerViewArr
        }
        
        dataContainerPickerView.reloadAllComponents()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textFieldTracer()
        switch textField {
        case countryTxtField:
            textField.inputView = dataContainerPickerView
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(closePickerView(txtField:)))
        case cityTxtField:
            textField.inputView = dataContainerPickerView
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(closePickerView(txtField:)))
        default:
            break
        }
       }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = AppColor.textFieldBackground
        textField.setPadding()
    }
}
