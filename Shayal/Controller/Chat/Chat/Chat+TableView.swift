//
//  Chat+TableView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setup TableView
    func setupTableView() {
        chatTV.delegate = self
        chatTV.dataSource = self
        mockData()
        
        chatTV.register(UINib(nibName: "ChatTVCell", bundle: nil), forCellReuseIdentifier: "ChatTVCell")
    }
    
    func mockData() {
        chatCellItem.append(ChatDataModel(profilePicture: UIImage(systemName: "message.circle.fill")!, userName: "Ahmed Mohamed".localized(), shortMsg: "Example text Example text Example text".localized(), IsOnline: true))
        chatCellItem.append(ChatDataModel(profilePicture: UIImage(systemName: "message.circle.fill")!, userName: "Mohamed Ahmed".localized(), shortMsg: "Example text Example text Example text".localized(), IsOnline: true))
        chatCellItem.append(ChatDataModel(profilePicture: UIImage(systemName: "message.circle.fill")!, userName: "Ahmed Moustafa".localized(), shortMsg: "Example text Example text Example text".localized(), IsOnline: true))
        chatCellItem.append(ChatDataModel(profilePicture: UIImage(systemName: "message.circle.fill")!, userName: "Mahmoud Mohamed".localized(), shortMsg: "Example text Example text Example text".localized(), IsOnline: false))
        chatCellItem.append(ChatDataModel(profilePicture: UIImage(systemName: "message.circle.fill")!, userName: "Youssef Mohamed".localized(), shortMsg: "Example text Example text Example text".localized(), IsOnline: false))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatCellItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTVCell", for: indexPath) as! ChatTVCell
        let item = chatCellItem[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = MessageVC(chatId: "10", reciptionistId: "20", reciptionistName: chatCellItem[indexPath.row].userName)
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
