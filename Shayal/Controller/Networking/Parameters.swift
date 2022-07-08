//
//  Parameters.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import Foundation


struct Params {
    
    /// {Phone, Password}
    static let loginParams : [String: Any] =
    [
     "phone": "",
     "password": "",
     "fcm_token_ios":"12312"
    ]
    
    /// {Method Type, Message}
    static let sendMsgparams : [String: Any] =
    [
        "_method":"PUT",
        "message": ""
    ]

}
