//
//  AddOrder+Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import Foundation

extension AddOrderVC {
    func localized() {
        deliveryFromTxtField.placeholder = "Get package from".localized()
        deliveryToTextField.placeholder = "Deliver To".localized()
        packageTypeTextField.placeholder = "Package Type".localized()
        vehicleModelTxtField.placeholder = "Vehicle Model".localized()
        weightTxtField.placeholder = "Weight".localized()
        vehicleTypeTxtField.placeholder = "Vehicle Type".localized()
        voucherTxtField.placeholder = "Voucher".localized()
        orderBtn.setTitle("Order".localized(), for: .normal)
    }
}
