//
//  AddOrder+GetOrderFromDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import Foundation

extension AddOrderVC: GetOrderFromDelegate {
    
    func getOrderFrom(location: String) {
        deliveryFromTxtField.text = location
    }
}
