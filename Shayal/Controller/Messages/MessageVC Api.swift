//
//  MessageVC Api.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.
//

import Foundation
import UIKit
import Gallery
import FTIndicator

extension MessageVC {
    
    // Get Chat ID
    func getChatID() -> Int {
        return chatData?.data.items[0].chatID ?? 0
    }
    
    // Get Chat Data
    func getMessagesApi(Url: String) {
        API.chatCodeNetwork(Url: Url) { [weak self] error, success, data  in
            guard let self = self else{return}
            if success != nil && success! {
            self.chatData = data
            self.insertMessages()
            self.messagesCollectionView.reloadData()
            self.setupPusher(channelID: self.getChatID())
            self.chatData?.data.paginate = data?.data.paginate
            self.hideIndicator()
            }
            
            else if success != nil && success! == false {
                self.hideIndicator()
                FTIndicator.showError(withMessage: "There is no chat Messages".localized())
            }
            
            else {
                self.hideIndicator()
                FTIndicator.showInfo(withMessage: "Something went wrong".localized())
            }
        }
    }
    
    // Insert Messages to mkMessage Array
    private func insertMessages() {
        for index in (0 ..< (chatData?.data.items.count ?? 0)){
            guard let item = chatData?.data.items else{return}
            mkMessages.insert(MKMessageMock(message: item[index]), at: 0)
        }
    }
    
    // Sending Messages API Func
    func sendMessagesApi(chatID: Int, Msg: String)  {
        API.sendMsgCodeNetwork(Url: "\(URLs.chat_Url)/\(chatID)", msg: Msg) { [weak self] error, success in
            guard let self = self else{return}
            if success != nil && success! {
            self.messagesCollectionView.reloadData()
            }
            
            else {
                FTIndicator.showInfo(withMessage: "Something went wrong".localized())
            }
        }
    }
}
