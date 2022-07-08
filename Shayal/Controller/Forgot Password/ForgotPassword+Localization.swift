//
//  ForgotPassword+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import Foundation

extension ForgotPasswordVC {
    func localized(){
        enterPhoneNumberLbl.text = "Enter your phone number".localized()
        nextBtn.setTitle("Next".localized(), for: .normal)
        invalidPhoneNumberLbl.text = "Invalid Phone Number".localized()
    }
}
