//
//  AddReport+TextView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension AddReportVC: UITextViewDelegate {
    
    // MARK: - Setup TextView
    func setupTextView() {
        reportContentTxtView.delegate = self
        reportContentTxtView.textContainer.lineFragmentPadding = 10
        reportContentTxtView.text = "Report Text".localized()
        reportContentTxtView.textColor = UIColor.darkGray
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
            textView.text = "Report Text".localized()
            textView.textColor = UIColor.darkGray
        }
    }
}
