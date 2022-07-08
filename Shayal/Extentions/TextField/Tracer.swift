//
//  Tracer.swift
//  Shayal
//
//  Created by Moustafa Anas on 05/05/2022.
//

import UIKit

extension UITextField {
    func textFieldTracer() {
        
        let currentLanguage = Locale.current.languageCode
        var tracerView = UIView()
        
        if currentLanguage == "ar" {
             tracerView = UIView(frame: CGRect(x: 9.0, y: 1.0, width: 5.0, height: self.frame.height - 2 ))
        } else {
             tracerView = UIView(frame: CGRect(x: 1.0, y: 1.0, width: 5.0, height: self.frame.height - 2 ))
        }
            tracerView.cornerRadius = 2
            tracerView.backgroundColor = AppColor.mainColor
            self.leftViewMode = .always
            let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: self.frame.height))
            containerView.addSubview(tracerView)
            self.leftView = containerView
    }
}
