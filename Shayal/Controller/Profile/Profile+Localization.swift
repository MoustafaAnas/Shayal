//
//  Profile+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import Foundation

extension ProfileVC {
    func localized() {
        userNameLbl.text = "Ahmed Mohamed Joe".localized()
        balanceLbl.text = "100 ".localized() + "S.R".localized()
        phoneNumberTitleLbl.text = "Phone Number".localized()
        countryTitleLbl.text = "Country".localized()
        countryLbl.text = "Kingdom of Saudi Arabia".localized()
    }
}
