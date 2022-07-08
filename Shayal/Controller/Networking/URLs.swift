//
//  URLs.swift
//  Shayal
//
//  Created by Moustafa Anas on 26/04/2022.
//

struct URLs {
    
    // Base URL
    static let base_Url = "https://beta.alqabedah.com/api/suppliers/"
    
    /// POST {phone, password}
    static let login_Url = base_Url + "auth/login"
    
    
    /// GET {token, x-company-id}
    static let chat_Url = base_Url + "chats"
}
