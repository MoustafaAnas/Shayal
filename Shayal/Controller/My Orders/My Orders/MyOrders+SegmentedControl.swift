//
//  MyOrders+SegmentedControl.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import Foundation
import AnimatableReload

extension MyOrdersVC {
    
    // MARK: - Setup Segment Control
    func setupSegmentControl() {
        orderStateSegmentControl.items = ["Pending Orders".localized(), "Active Orders".localized(), "Done Orders".localized()]
        orderStateSegmentControl.selectedIndex = 0
        orderStateSegmentControl.addTarget(self, action: #selector(self.segmentValueChanged), for: .valueChanged)
        AnimatableReload.reload(tableView: self.myOrdersTV, animationDirection: "left".localized())
    }
    
    @objc func segmentValueChanged() {
        switch orderStateSegmentControl.selectedIndex {
        case 0:
            noDataToDisplayMsg(tableview: myOrdersTV, tableViewDataArrCount: pendingOrdersCellItems.count, tintColor: .lightGray, msg: "No pending orders".localized())
            AnimatableReload.reload(tableView: self.myOrdersTV, animationDirection: "left".localized())
        case 1:
            noDataToDisplayMsg(tableview: myOrdersTV, tableViewDataArrCount: ordersCellItems.count, tintColor: .lightGray, msg: "No active orders".localized())
            AnimatableReload.reload(tableView: self.myOrdersTV, animationDirection: "right".localized())
        case 2:
            noDataToDisplayMsg(tableview: myOrdersTV, tableViewDataArrCount: ordersCellItems.count, tintColor: .lightGray, msg: "Empty".localized())
            AnimatableReload.reload(tableView: self.myOrdersTV, animationDirection: "right".localized())
        default:
            break
        }
    }
}
