//
//  Register+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/07/2022.
//

import Foundation

extension RegisterVC {
    func localized() {
        welcomeLbl.text = "Welcome To Shayal App".localized()
        registerBenefitsLbl.text = "Please login to save your search result and your orders and surely for more fun!".localized()
        haveAccountAlreadyLbl.text = "Have Account Already? ".localized()
        registerBtn.setTitle("Register".localized(), for: .normal)
    }
}
