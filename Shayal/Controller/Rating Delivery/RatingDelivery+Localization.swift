//
//  RatingDelivery+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import Foundation

extension RatingDeliveryVC {
    func localized() {
        ratingDeliveryVCTitleLbl.text = "Rating Delivery".localized()
        rateBtn.setTitle("Rate".localized(), for: .normal)
    }
}
