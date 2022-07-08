//
//  AddOrder+CheckValidation.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import Foundation
import ANActivityIndicator
import FTIndicator

extension AddOrderVC {
    
    // MARK: - Check Order Data Validation
    func checkOrderDataValidation() {
        guard let getOrder = deliveryFromTxtField.text, !getOrder.isEmpty else{
            FTIndicator.showError(withMessage: "Enter your order location".localized())
            return
        }
        
        guard let deliverTo = deliveryToTextField.text, !deliverTo.isEmpty else{
            FTIndicator.showError(withMessage: "Enter your location".localized())
            return
        }
        
        guard let packageType = packageTypeTextField.text, !packageType.isEmpty else{
            FTIndicator.showError(withMessage: "Enter package type".localized())
            return
        }

        guard let vehicleModel = vehicleModelTxtField.text, !vehicleModel.isEmpty else{
            FTIndicator.showError(withMessage: "Enter vehicle model".localized())
            return
        }

        guard let weight = weightTxtField.text, !weight.isEmpty else{
            FTIndicator.showError(withMessage: "Enter package weight".localized())
            return
        }

        guard let vehicleType = vehicleTypeTxtField.text, !vehicleType.isEmpty else{
            FTIndicator.showError(withMessage: "Enter vehicle type".localized())
            return
        }
        
        showIndicator(message: "Loading...".localized(), messageTopMargin: 20, animationType: .ballRotateChase)
        navigationController?.popViewController(animated: true)
        hideIndicator()
        FTIndicator.showSuccess(withMessage: "Ordered Successfully, You will recive offer from our delivery soon".localized(), image: UIImage(named: "DeliveryPin"), userInteractionEnable: false)
    }
}
