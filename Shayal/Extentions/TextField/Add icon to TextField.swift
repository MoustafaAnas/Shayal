//
//  Add icon to TextField.swift
//  Shayal
//
//  Created by Moustafa Anas on 22/04/2022.
//
import UIKit

extension UITextField {
    func addRightIcon(icon: UIImage, tintColor: UIColor){
        
        let rightAddedIcon = UIImageView(frame: CGRect(x: 10.0, y: (self.frame.height)/2 - 7, width: 14, height: 14))
        rightAddedIcon.image = icon
        rightAddedIcon.tintColor = tintColor
        self.rightViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.frame.height))
        view.addSubview(rightAddedIcon)
        self.rightView = view
    }
    
    func addLeftIcon(icon: UIImage, tintColor: UIColor){
        
        let leftAddedIcon = UIImageView(frame: CGRect(x: 10.0, y: (self.frame.height)/2 - 10, width: 20, height: 20))
        leftAddedIcon.image = icon
        leftAddedIcon.tintColor = tintColor
        self.leftViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.frame.height))
        view.addSubview(leftAddedIcon)
        self.leftView = view
        
    }
    
}
