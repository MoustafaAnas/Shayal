//
//  Localization.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import Foundation

extension String {
    
    func localized() -> String {
        return  NSLocalizedString(self, comment: "")
    }
}
