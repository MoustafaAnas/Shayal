//
//  EditProfile+TextFieldDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit
import IQKeyboardManagerSwift

extension EditProfileVC: UITextFieldDelegate {

    // MARK: - Setup TextFields
    func setupTextField() {
       
        nameTxtField.attributedPlaceholder = NSAttributedString(string: "Name".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        phoneNumberTxtField.attributedPlaceholder = NSAttributedString(string: "Phone Number".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        countryTxtField.attributedPlaceholder = NSAttributedString(string: "Country".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        cityTxtField.attributedPlaceholder = NSAttributedString(string: "City".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        bankTxtField.attributedPlaceholder = NSAttributedString(string: "Bank".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        bankAccountTxtField.attributedPlaceholder = NSAttributedString(string: "Bank Account Number".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        changePasswordTxtField.attributedPlaceholder = NSAttributedString(string: "Change Password".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        nameTxtField.setPadding()
        phoneNumberTxtField.setPadding()
        countryTxtField.setPadding()
        cityTxtField.setPadding()
        changePasswordTxtField.setPadding()
        bankTxtField.setPadding()
        bankAccountTxtField.setPadding()
        
        countryTxtField.addRightIcon(icon: UIImage(named: "down-filled-arrow")!, tintColor: .white)
        cityTxtField.addRightIcon(icon: UIImage(named: "down-filled-arrow")!, tintColor: .white)
        bankTxtField.addRightIcon(icon: UIImage(named: "down-filled-arrow")!, tintColor: .white)
        
        nameTxtField.backgroundColor = AppColor.textFieldBackground
        phoneNumberTxtField.backgroundColor = AppColor.textFieldBackground
        countryTxtField.backgroundColor = AppColor.textFieldBackground
        cityTxtField.backgroundColor = AppColor.textFieldBackground
        bankTxtField.backgroundColor = AppColor.textFieldBackground
        bankAccountTxtField.backgroundColor = AppColor.textFieldBackground
        changePasswordTxtField.backgroundColor = AppColor.textFieldBackground
        
        nameTxtField.delegate = self
        phoneNumberTxtField.delegate = self
        countryTxtField.delegate = self
        cityTxtField.delegate = self
        bankTxtField.delegate = self
        bankAccountTxtField.delegate = self
        changePasswordTxtField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        switch textField {
        case countryTxtField: pickerViewArr = countryPickerViewArr
        case cityTxtField: pickerViewArr = cityPickerViewArr
        case bankTxtField: pickerViewArr = bankPickerViewArr
        default: break
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

        case bankTxtField:
            textField.inputView = dataContainerPickerView
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(closePickerView(txtField:)))

        case changePasswordTxtField:
            view.endEditing(true)
            let vc = ChangePasswordVC()
            vc.view.backgroundColor = UIColor.clear
            vc.view.isOpaque = false
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
            
        default:
            break
            
        }
       }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = AppColor.textFieldBackground
        textField.setPadding()
    }
}
