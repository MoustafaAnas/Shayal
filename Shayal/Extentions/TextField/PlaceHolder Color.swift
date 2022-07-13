//
//  PlaceHolder Color.swift
//  Shayal
//
//  Created by Moustafa Anas on 13/05/2022.
//

import UIKit

extension UITextField {
    func placeHolderColor(color: UIColor) {
        guard let placeholder = self.placeholder else{return}
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
}
