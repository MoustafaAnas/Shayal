//
//  Padding.swift
//  Shayal
//
//  Created by Moustafa Anas on 22/04/2022.
//

import UIKit

extension UITextField {
    
    func setPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}
