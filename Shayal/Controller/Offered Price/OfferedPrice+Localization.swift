//
//  OfferedPrice+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import Foundation

extension OfferedPriceVC {
    func localized() {
        offeredPriceVCTitleLbl.text = "Offered Price".localized()
        deliveryRatingTitleLbl.text = "Delivery Rating".localized()
        offeredPriceTitleLbl.text = "Offered Price".localized()
        offredPriceLbl.text = "50 ".localized() + "S.R".localized()
        timeToDeliverLbl.text = "Time To Deliver".localized()
        timeToDeliverLbl.text = "30 ".localized() + "Min".localized()
        distanceByKMTitleLbl.text = "Distance by Km".localized()
        distanceByKMLbl.text = "10 ".localized() + "Km".localized()
        approveOfferBtn.setTitle("Approve".localized(), for: .normal)
        refuseOfferBtn.setTitle("Refuse".localized(), for: .normal)
    }
}
