//
//  MyOrders+TableView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension MyOrdersVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setup TableView
    func setupTableView() {
        myOrdersTV.delegate = self
        myOrdersTV.dataSource = self
        mockData()
        myOrdersTV.register(UINib(nibName: "PendingOrdersCell", bundle: nil), forCellReuseIdentifier: "PendingOrdersCell")
        myOrdersTV.register(UINib(nibName: "ActiveOrdersCell", bundle: nil), forCellReuseIdentifier: "ActiveOrdersCell")
        myOrdersTV.register(UINib(nibName: "DoneOrdersCell", bundle: nil), forCellReuseIdentifier: "DoneOrdersCell")
    }
    
    func mockData() {
        pendingOrdersCellItems.append(PendingOrdersModel(deliveryName: "Ahmed Mohamed".localized(), deliveryGuyImg: UIImage(systemName: "person.circle")!, getOrderFrom: "Cairo".localized(), deliverTo: "Masnoura".localized(), packageType: "Light".localized(), packageWeight: "50".localized(), vehicleType: "Car".localized()))
        
        pendingOrdersCellItems.append(PendingOrdersModel(deliveryName: "Mohamed Mahmoud".localized(), deliveryGuyImg: UIImage(systemName: "person.circle")!, getOrderFrom: "Alex".localized(), deliverTo: "Masnoura".localized(), packageType: "Light".localized(), packageWeight: "60".localized(), vehicleType: "Car".localized()))
        
        pendingOrdersCellItems.append(PendingOrdersModel(deliveryName: "Moustafa Mohamed".localized(), deliveryGuyImg: UIImage(systemName: "person.circle")!, getOrderFrom: "Cairo".localized(), deliverTo: "Alex".localized(), packageType: "Light".localized(), packageWeight: "70".localized(), vehicleType: "Car".localized()))
        
        ordersCellItems.append(OrdersModel(deliveryName: "Ahmed Mohamed".localized(), deliveryGuyImg: UIImage(systemName: "person.circle")!, orderPrice: "40", transportType: "Car".localized(), orderState: "Heading to receive".localized()))
        
        ordersCellItems.append(OrdersModel(deliveryName: "Ahmed Mahmoud".localized(), deliveryGuyImg: UIImage(systemName: "person.circle")!, orderPrice: "60", transportType: "Car".localized(), orderState: "Preparing".localized()))
        
        ordersCellItems.append(OrdersModel(deliveryName: "Moustafa Mohamed".localized(), deliveryGuyImg: UIImage(systemName: "person.circle")!, orderPrice: "70", transportType: "Car".localized(), orderState: "Preparing".localized()))
        
        ordersCellItems.append(OrdersModel(deliveryName: "Ahmed Anas".localized(), deliveryGuyImg: UIImage(systemName: "person.circle")!, orderPrice: "80", transportType: "Car".localized(), orderState: "Heading to receive".localized()))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch orderStateSegmentControl.selectedIndex {
        case 0: return pendingOrdersCellItems.count
        case 1: return ordersCellItems.count
        case 2: return ordersCellItems.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if orderStateSegmentControl.selectedIndex == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PendingOrdersCell", for: indexPath) as! PendingOrdersCell
        let item = pendingOrdersCellItems[indexPath.row]
        cell.configureCell(item: item)
        
        return cell
        }
        
        else if orderStateSegmentControl.selectedIndex == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveOrdersCell", for: indexPath) as! ActiveOrdersCell
            let item = ordersCellItems[indexPath.row]
            cell.configureCell(item: item)
            cell.cancelOrderBtn.tag = indexPath.row
            cell.chatBtn.addTarget(self, action:#selector(goToChatVC), for: .touchUpInside)
            cell.cancelOrderBtn.addTarget(self, action:#selector(cancelOrderBtnAction), for: .touchUpInside)
            
            if cell.orderState.text == "Preparing".localized() {
                cell.cancelOrderBtn.isHidden = false
            } else {
                cell.cancelOrderBtn.isHidden = true
            }
            
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoneOrdersCell", for: indexPath) as! DoneOrdersCell
            let item = ordersCellItems[indexPath.row]
            cell.configureCell(item: item)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch orderStateSegmentControl.selectedIndex {
        case 0: navigationController?.pushViewController(InvoiceVC(), animated: true)
        default: break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch orderStateSegmentControl.selectedIndex {
        case 0: return 190
        case 1: return 150
        case 2: return 120
        default: return 0
        }
    }
    
    // MARK: - Cell Buttons Actions
    
    // Go to Chat ViewController after clicking on chatBtn
    @objc func goToChatVC(){
        tabBarController?.selectedIndex = 2
    }
    
    // cancel order after clicking on cancelOrderBtn
    @objc func cancelOrderBtnAction(sender: UIButton){
        let indexpath = IndexPath(row: sender.tag, section: 0)
        myOrdersTV.reloadData()
        myOrdersTV.beginUpdates()
        ordersCellItems.remove(at: indexpath.row)
        myOrdersTV.deleteRows(at: [indexpath], with: .automatic)
        myOrdersTV.endUpdates()
        noDataToDisplayMsg(tableview: myOrdersTV, tableViewDataArrCount: ordersCellItems.count, tintColor: .lightGray, msg: "Empty")
    }
}
