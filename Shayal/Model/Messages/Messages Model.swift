//
//  Chat.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.
//

import Foundation

// MARK: - Welcome
struct ChatModel: Codable {
    let status: Bool
    var data: ChatDataClass
}

// MARK: - DataClass
struct ChatDataClass: Codable {
    var items: [ChatItem]
    var paginate: Paginate?
    let extra: Extra?
}

// MARK: - Extra
struct Extra: Codable {
    let chatID: Int?

    enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
    }
}

// MARK: - Item
struct ChatItem: Codable {
    let id, chatID: Int?
    let user: UserDataModel?
    let message: String?
    let type: String?
    let attachment, thumbnail: String?
    let pucherType: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case chatID = "chat_id"
        case user, message, type, attachment, thumbnail, pucherType
    }
}












