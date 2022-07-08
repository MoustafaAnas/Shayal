//
//  Grediant.swift
//  Shayal
//
//  Created by Moustafa Anas on 22/04/2022.

import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo:UIColor) {
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = bounds
        
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        
        gradientLayer.startPoint = CGPoint (x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint (x: 1.0, y: 0.5)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
