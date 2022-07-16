//
//  Helper.swift
//  Shayal
//
//  Created by Moustafa Anas on 21/04/2022.
//

import Foundation

import UIKit

final class Helper: NSObject {
    
    // MARK: - Restert App
    class func restartApp() {
        guard let window = UIApplication.shared.currentWindow else {return}
        
        let vc: UIViewController
        if getApiToken() == nil {
            vc = UINavigationController(rootViewController: LoginVC())
        }
        else {
            vc = TabbarManager()
        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
    // MARK: - Token
    class func getApiToken() -> String? {
        let token = UserDefaults.standard.object(forKey: "token") as? String
        
        return token
    }
    
    // MARK: - Flag
    class func getFlag() -> Bool? {
        let flag = UserDefaults.standard.object(forKey: "flag") as? Bool
        
        return flag
    }
    
    // MARK: - ID
    class func getUserID() -> Int {
        let id = UserDefaults.standard.object(forKey: "id") as! Int
        
        return id
    }
    
    // MARK: - Name
    class func getUserName() -> String {
        let name = UserDefaults.standard.object(forKey: "name") as! String
        
        return name
    }

}

