//
//  PayMethod+GestureRecognizer.swift
//  Shayal
//
//  Created by Moustafa Anas on 13/05/2022.
//

import UIKit

extension PayMethodVC {
    
    func setupGestureRecognizer() {
        customizeBlurViewAction()
        customizeCreditCardLblAction()
        customizeCashLblAction()
    }
    
    func customizeBlurViewAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCancelPayMethod))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        blurView.addGestureRecognizer(gesture)
    }
    
    @objc func didCancelPayMethod() {
        self.dismiss(animated: true)
    }
    
    func customizeCreditCardLblAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didPressedCreditCardLbl))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        creditCardView.addGestureRecognizer(gesture)
    }
    
    @objc func didPressedCreditCardLbl() {
        payWithCashRadioBtn.backgroundColor = .white
        payWithCreditCardRadioBtn.backgroundColor = AppColor.mainColor
    }
    
    func customizeCashLblAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didPressedCashLbl))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        cashView.addGestureRecognizer(gesture)
    }
    
    @objc func didPressedCashLbl() {
        payWithCashRadioBtn.backgroundColor = AppColor.mainColor
        payWithCreditCardRadioBtn.backgroundColor = .white
    }
}
