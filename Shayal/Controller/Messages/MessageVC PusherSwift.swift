//
//  MessageVC PusherSwift.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.
//

import Foundation
import PusherSwift

extension MessageVC: PusherDelegate {
    
    // Sync Chat by Using Pusher Websocket
    func setupPusher(channelID : Int){
            let optionsWithEndpoint = PusherClientOptions(
                host : .cluster("eu"))
            pusher = Pusher(key: "3478a80ff3abcb791bd1", options: optionsWithEndpoint)
            let myChannel = pusher.subscribe("chat-\(channelID)")
            myChannel.bind(eventName: "NewMessageEvent" , eventCallback: { (data: PusherEvent) -> Void in
                if let data = self.convertToDictionary(text: data.data ?? "") {
                    guard let messageCollection : [String : AnyObject] = data["message"] as? [String : AnyObject] else{return}
                    guard let user = messageCollection["user"] else { return  }
                    guard let userID = messageCollection["id"] as? Int else{return}
                    guard let body : String = messageCollection["message"] as? String else{return}
                    guard let type : String = messageCollection["type"] as? String else{return}
                    let attachment : String = messageCollection["attachment"] as? String ?? ""
            
                    let item = ChatItem(id: messageCollection["id"] as? Int ?? 0, chatID: self.getChatID(), user: user as? UserDataModel, message: body, type: type, attachment: attachment, thumbnail: "", pucherType: type)
                    
                    guard let type : String = messageCollection["type"] as? String else{return}
//                    if type == "image" {
//                        self.items.append(self.addImageMessage(item: item, senderId: userID))
//                    }
//                    if type == "voice" {
//                        guard let msg = self.addVoiceMessage(item: item, senderId: userID) else {return}
//                        self.items.append(msg)
//                    }
                    let uID = UserDefaults.standard.object(forKey: "id") as? Int
                    if userID != uID {
                        if type == "message" {
                            self.mkMessages.append(MKMessageMock(message: item))
                        }
                    }
//                    if type == "video" {
//                        self.items.append(self.addVideoMessage(item: item, senderId: userID))
//                    }
                    print(item)
                    self.messagesCollectionView.reloadData()
                    self.messagesCollectionView.scrollToLastItem()
                    print("allMessages: \(self.mkMessages)")
                }
            })
            
            pusher.delegate = self
            pusher.connect()
        }
    
    // Convertiong String to Dictionary
    func convertToDictionary(text: String) -> [String: Any]? {
            if let data = text.data(using: .utf8) {
                do {
                    return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch {
                    print(error.localizedDescription)
                }
            }
            return nil
        }
    
    // Check if Subscribtion successfuly
    func failedToSubscribeToChannel(name: String, response: URLResponse?, data: String?, error: NSError?) {
            print(name)
            print(response ?? "nil")
            print(data ?? "nil")
            print(error?.localizedDescription ?? "nil")
        }

    // Subscribed Channel
        func subscribedToChannel(name: String) {
            print("subscribed to : (name)")
        }
}
    
