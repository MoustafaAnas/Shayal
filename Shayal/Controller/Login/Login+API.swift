//
//  Login+API.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import Foundation
import ANActivityIndicator
import FTIndicator

extension LoginVC {
    
    // MARK: - Setup Api
    func loginApi(phoneNumber: String, Password: String) {
        showIndicator(message: "Loading...".localized(), messageTopMargin: 20, animationType: .ballRotateChase)
        API.loginCodeNetwork(Url: URLs.login_Url, phoneNumber: phoneNumber, password: Password) { [weak self] error, success, userInfo  in
            guard let self = self else{return}
            if success != nil && success! {
                FTIndicator.showSuccess(withMessage: "Login Successfully")
                let pref = UserDefaults.standard
                pref.set(userInfo?.token, forKey: "token")
                pref.set(userInfo?.id, forKey: "id")
                pref.set(userInfo?.companyName, forKey: "companyName")
                pref.set(userInfo?.commercialNumber, forKey: "commercialNumber")
                pref.set(userInfo?.email, forKey: "email")
                pref.set(userInfo?.image, forKey: "image")
                pref.set(userInfo?.licenceImage, forKey: "licenceImage")
                pref.set(userInfo?.commercialImage, forKey: "commercialImage")
                pref.set(userInfo?.phone, forKey: "phone")
                pref.set(userInfo?.name, forKey: "name")
                pref.set(userInfo?.address, forKey: "address")
                pref.set(userInfo?.landline, forKey: "landline")
                pref.set(true, forKey: "flag")
                print(userInfo?.token as Any)
                pref.synchronize()
                Helper.restartApp()
                self.hideIndicator()
            }
            
            else if success != nil && success! == false {
                self.hideIndicator()
                FTIndicator.showError(withMessage: "Phone Number or Password is not Correct".localized())
            }
            
            else {
                self.hideIndicator()
                FTIndicator.showInfo(withMessage: "Something went wrong".localized())
            }
        }
    }
}
