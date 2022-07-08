//
//  RatingDelivery+TextFieldDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension RatingDeliveryVC: UITextViewDelegate {
    
    // MARK: - Setup TextView
    func setupTextView() {
        ratingTextView.delegate = self
        ratingTextView.textContainer.lineFragmentPadding = 10
        ratingTextView.text = "Rate Delivery".localized()
        ratingTextView.textColor = UIColor.darkGray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.darkGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Rate Delivery".localized()
            textView.textColor = UIColor.darkGray
        }
    }
}
