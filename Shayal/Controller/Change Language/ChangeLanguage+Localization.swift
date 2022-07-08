//
//  ChangeLanguage+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import Foundation

extension ChangeLanguageVC {
    func localized() {
        changeLanguageTitleLbl.text = "Language".localized()
        chooseLanguageTitleLbl.text = "Please Choose Language".localized()
        saveBtn.setTitle("Save".localized(), for: .normal)
    }
}
