//
//  MessageVC LayoutDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.
//

import Foundation
import MessageKit

extension MessageVC: MessagesLayoutDelegate {
    
    // Cell top labels height
//    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
//        if indexPath.section % 3 == 0 {
//            if ((indexPath.section == 0) && (allLocalMessages.count > displayingMessagesCount)) {
//                return 40
//            }
//        }
//        return 10
//    }
    
    // Cell bottom labels height
    func cellBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return isFromCurrentSender(message: message) ? 17 : 0
    }
    
    // Message bottom labels height
    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return indexPath.section != mkMessages.count - 1 ? 10 : 0
    }
    
    // Avatar Initials
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.set(avatar: Avatar(initials: mkMessages[indexPath.section].senderInitials))
    }
}
