//
//  NewPassword+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import Foundation

extension NewPasswordVC {
    func localized() {
        newPasswordTitleLbl.text = "Enter Your New Password".localized()
        clarifyingPasswordProbetiesLbl.text = "Dear user, the longer the password is and contains letters and numbers, the better the security".localized()
        saveBtn.setTitle("Save".localized(), for: .normal)
    }
}
