//
//  EditProfile+CheckValidation.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import Foundation
import ANActivityIndicator
import FTIndicator

extension EditProfileVC {
    
    // MARK: - Check Edited Data Profile Validation
    func checkEditedDataValidation() {
        if checknameValidation() && checkPhoneNumberValidation() && checkBankValidation() && checkBankAccountNumberValidation() && checkCountryValidation() && checkCityValidation() {
            showIndicator(message: "Loading...".localized(), messageTopMargin: 20, animationType: .ballRotateChase)
            navigationController?.popViewController(animated: true)
            FTIndicator.showSuccess(withMessage: "Profile Info Updated Successfully")
            hideIndicator()
        }
    }
    
    func checknameValidation() -> Bool {
        guard let name = nameTxtField.text, !name.isEmpty, name.count >= 2 else {
            nameTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Please fill your name field".localized())
            return false
        }
        nameTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }

    func checkPhoneNumberValidation() -> Bool {
        guard let phoneNumber = phoneNumberTxtField.text, !phoneNumber.isEmpty, phoneNumber.count == 11, phoneNumber.isValidPhone() else {
            phoneNumberTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Please fill your phone number field".localized())
            return false
        }
        phoneNumberTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }

    func checkBankValidation() -> Bool {
        guard let bank = bankTxtField.text, !bank.isEmpty, bank.count >= 2 else {
            bankTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Please choose your bank".localized())
            return false
        }
        bankTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }

    func checkBankAccountNumberValidation() -> Bool {
        guard let bankAccount = bankAccountTxtField.text, !bankAccount.isEmpty, bankAccount.count >= 8 else {
            bankAccountTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Please fill your bank account number field".localized())
            return false
        }
        bankAccountTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
    
    func checkCountryValidation() -> Bool {
        guard let country = countryTxtField.text, !country.isEmpty, country.count >= 2 else {
            countryTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Please choose your country".localized())
            return false
        }
        countryTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }

    func checkCityValidation() -> Bool {
        guard let city = cityTxtField.text, !city.isEmpty, city.count >= 2 else {
            cityTxtField.backgroundColor = AppColor.inValidTextFieldBackground
            FTIndicator.showToastMessage("Please choose your city".localized())
            return false
        }
        cityTxtField.backgroundColor = AppColor.textFieldBackground
            return true
    }
}
