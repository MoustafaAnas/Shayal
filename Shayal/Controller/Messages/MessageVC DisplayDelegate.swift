//
//  MessageVC DisplayDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.
//

import Foundation
import MessageKit
import UIKit

extension MessageVC: MessagesDisplayDelegate {
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return .label
    }
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        let bubleColorOutgoing = UIColor(red: 231/255, green: 249/255, blue: 248/255, alpha: 1)
        let bubleColorIncoming = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        return isFromCurrentSender(message: message) ? bubleColorOutgoing : bubleColorIncoming
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        let tail: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(tail, .curved)
    }
}
