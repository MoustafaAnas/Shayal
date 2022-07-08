//
//  Reports+TableView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension ReportsVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        reportsTV.delegate = self
        reportsTV.dataSource = self
        
        mockData()
        reportsTV.register(UINib(nibName: "ReportsTVCell", bundle: nil), forCellReuseIdentifier: "ReportsTVCell")
    }
    
    func mockData() {
        reportsCellItem.append("Delay in receiving orders...".localized())
        reportsCellItem.append("Item Is Missing...".localized())
        reportsCellItem.append("Delay in receiving orders...".localized())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportsCellItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReportsTVCell", for: indexPath) as! ReportsTVCell
        cell.reportContentLbl.text = reportsCellItem[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(reportsCellItem[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
