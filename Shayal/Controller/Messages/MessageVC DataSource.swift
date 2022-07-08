//
//  MessageVC DataSource.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.
//

import Foundation
import MessageKit

extension MessageVC: MessagesDataSource {
    
    func setupMessageCV() {
        messagesCollectionView.messageCellDelegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        
        scrollsToBottomOnKeyboardBeginsEditing = true
        maintainPositionOnKeyboardFrameChanged = true
        messagesCollectionView.refreshControl = refreshController
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return mkMessages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return mkMessages.count
    }
    
    // Cell top labels
    
//    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
//        if indexPath.section % 3 == 0 {
//
//            let showLoadMore = (indexPath.section == 0) && (allLocalMessages.count > displayingMessagesCount)
//            let text = showLoadMore ? "Pull to load more": MessageKitDateFormatter.shared.string(from: message.sentDate)
//            let font = showLoadMore ? UIFont(name: "Almarai-Regular", size: 13) : UIFont(name: "Almarai-Regular", size: 10)
//            let color = showLoadMore ? AppColor.mainColor : .darkGray
//
//            return NSAttributedString(string: text, attributes: [.font: font!, .foregroundColor: color])
//        }
//        return nil
//    }
    
//    // Cell bottom labels
//    func cellBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
//        if isFromCurrentSender(message: message) {
//            let message = mkMessages[indexPath.section]
//            let status = indexPath.section == mkMessages.count - 1 ? message.status + "  " + message.readDate.time() : ""
//
//            let font = UIFont.boldSystemFont(ofSize: 10)
//            let color = UIColor.darkGray
//
//            return NSAttributedString(string: status, attributes: [.font: font, .foregroundColor: color])
//        }
//        return nil
//    }
    
    // message bottom labels
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        if indexPath.section != mkMessages.count - 1 {
            let font = UIFont.boldSystemFont(ofSize: 10)
            let color = UIColor.darkGray
            return NSAttributedString(string: message.sentDate.time(), attributes: [.font: font, .foregroundColor: color])
        }
        return nil
    }
}
