//
//  Invoice+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import Foundation

extension InvoiceVC {
    func localized() {
        deliveryGuyName.text = "Ahmed Mohamed".localized()
        finalCostMoneyLbl.text = "Final Cost".localized()
        finalCostMoneyLbl.text = "50 ".localized() + "S.R".localized()
        nextBtn.setTitle("Next".localized(), for: .normal)
    }
}
