//
//  Logout+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import Foundation

extension LogoutVC {
    func localized() {
        logoutTitleLbl.text = "Do you want to logout?".localized()
        logoutBtn.setTitle("Logout".localized(), for: .normal)
        cancelBtn.setTitle("Cancel".localized(), for: .normal)
    }
}
