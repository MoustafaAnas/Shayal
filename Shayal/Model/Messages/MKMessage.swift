//
//  MKMessage.swift
//  Shayal
//
//  Created by Moustafa Anas on 30/04/2022.
//

import MessageKit

class MKMessageMock: NSObject, MessageType {
    var messageId: String
    var kind: MessageKind
    var sentDate: Date
    var mkSender: MKSender
    var sender: SenderType {return mkSender}
    var senderInitials: String
    
    var photoItem: PhotoMessage?
    //var status: String
    //var incoming: Bool
    
    init(message: ChatItem) {
        messageId = "\(message.id ?? 0)"
        mkSender = MKSender(senderId: "\(message.user?.id ?? 0)", displayName: message.user?.name! ?? "")
        kind = MessageKind.text(message.message ?? kTEXT)
        
        switch message.type {
        case kTEXT:
            kind = MessageKind.text(message.message ?? kTEXT)
        case kPHOTO:
            let photoItem = PhotoMessage(path: message.attachment ?? "")
            kind = MessageKind.photo(photoItem)
            self.photoItem = photoItem
        default: break
        }
        
        senderInitials = "\((message.user?.name)?.first ?? "U")"
        sentDate = Date()
    }
}


