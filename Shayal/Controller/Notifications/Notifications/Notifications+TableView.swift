//
//  Notifications+TableView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setup TableView
    func setupTableView() {
        notificationsTV.delegate = self
        notificationsTV.dataSource = self
        
        mockData()
        notificationsTV.register(UINib(nibName: "NotificationsCell", bundle: nil), forCellReuseIdentifier: "NotificationsCell")
    }
    
    func mockData() {
        notificationsCellItem.append(NotificationsDataModel(userName: "Ahmed Mohamed".localized(), notificationMsg: "Ahmed Mohamed".localized() + " Received your order and offered you a price".localized(), isCompleted: false))
        notificationsCellItem.append(NotificationsDataModel(userName: "Mohamed Ahmed".localized(), notificationMsg: "Mohamed Ahmed".localized() + " Received your order and offered you a price".localized(), isCompleted: false))
        notificationsCellItem.append(NotificationsDataModel(userName: "Ahmed Joe".localized(), notificationMsg: "Rate our delivery".localized(), isCompleted: true))
        notificationsCellItem.append(NotificationsDataModel(userName: "Joe Mohamed".localized(), notificationMsg: "Rate our delivery".localized(), isCompleted: true))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationsCellItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath) as! NotificationsCell
        let item = notificationsCellItem[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if notificationsCellItem[indexPath.row].isCompleted {
            let vc = RatingDeliveryVC()
            vc.view.backgroundColor = UIColor.clear
            vc.view.isOpaque = false
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
        
        else {
            let vc = OfferedPriceVC()
            vc.view.backgroundColor = UIColor.clear
            vc.view.isOpaque = false
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
