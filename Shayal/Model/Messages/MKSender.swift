//
//  MKSender.swift
//  Shayal
//
//  Created by Moustafa Anas on 29/04/2022.
//

import MessageKit

struct MKSender: SenderType, Codable {
    var senderId: String
    var displayName: String
}
