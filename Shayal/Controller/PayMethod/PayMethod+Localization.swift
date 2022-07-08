//
//  PayMethod+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import Foundation

extension PayMethodVC {
    func localized() {
        payMethodTitleLbl.text = "Pay Method".localized()
        payWithTitleLbl.text = "Pay With".localized()
        creditCardTitleLbl.text = "Credit Card".localized()
        payWithTitle2Lbl.text = "Pay With".localized()
        cashTitleLbl.text = "Cash".localized()
        nextBtn.setTitle("Next".localized(), for: .normal)
    }
}
