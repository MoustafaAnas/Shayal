//
//  AddReport+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import Foundation

extension AddReportVC {
    func localized() {
        addReportTitleLbl.text = "Add Report".localized()
        userNameTxtField.text = "Ahmed Mohamed".localized()
        reportBtn.setTitle("Report".localized(), for: .normal)
    }
}
