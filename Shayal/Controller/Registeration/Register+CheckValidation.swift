//
//  Register+CheckValidation.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import Foundation
import ANActivityIndicator
import FTIndicator

extension RegisterVC {
    
    // MARK: - Check Register Validation
    func checkRegisterValidation() {
        if checknameValidation() && checkPhoneNumberValidation() && checkCountryValidation() && checkCityValidation() && checkPasswordValidation() && checkConfirmPasswordValidation() {
            showIndicator(message: "Loading...".localized(), messageTopMargin: 20, animationType: .ballRotateChase)
            navigationController?.popViewController(animated: true)
            hideIndicator()
            FTIndicator.showSuccess(withMessage: "Registerd Successfully".localized())
        }
    }
    
    func checknameValidation() -> Bool {
        guard let name = nameTxtField.text, !name.isEmpty, name.count >= 2 else {
            nameTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Enter your Name".localized())
            return false
        }
        nameTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
    
    func checkPhoneNumberValidation() -> Bool {
        guard let phoneNumber = phoneNumberTxtField.text, !phoneNumber.isEmpty, phoneNumber.count == 11, phoneNumber.isValidPhone() else {
            phoneNumberTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Enter your Phone Number".localized())
            return false
        }
        phoneNumberTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
    
    func checkCountryValidation() -> Bool {
        guard let country = countryTxtField.text, !country.isEmpty, country.count >= 2 else {
            countryTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Enter your Country Name".localized())
            return false
        }
        countryTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
    
    func checkCityValidation() -> Bool {
        guard let city = cityTxtField.text, !city.isEmpty, city.count >= 2 else {
            cityTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Enter your City Name".localized())
            return false
        }
        cityTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
    
    func checkPasswordValidation() -> Bool {
        guard let password = passwordTxtField.text, !password.isEmpty, password.count > 5 else {
            passwordTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Enter Valid Password".localized())
            return false
        }
        passwordTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
    
    func checkConfirmPasswordValidation() -> Bool {
        guard let confirmPassword = confirmPasswordTxtField.text, !confirmPassword.isEmpty else{
            confirmPasswordTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Enter Confirm Password".localized())
            return false
        }
            if confirmPassword != passwordTxtField.text {
            confirmPasswordTxtField.backgroundColor = AppColor.inValidTextFieldBackground
                FTIndicator.showToastMessage("Confirm Password does not match your password".localized())
            return false
        }
        confirmPasswordTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
}

