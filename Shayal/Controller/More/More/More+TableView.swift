//
//  More+TableView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit


extension MoreVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setup TableView
    func setupTableView() {
        moreTV.delegate = self
        moreTV.dataSource = self
        setupMoreData()
        moreTV.register(UINib(nibName: "MoreTVCell", bundle: nil), forCellReuseIdentifier: "MoreTVCell")
    }
    
    func setupMoreData() {
        moreCellItems.append(MoreDataModel(iconCell: UIImage(named: "IconMore1")!, titleCell: "Reports".localized()))
        moreCellItems.append(MoreDataModel(iconCell: UIImage(named: "IconMore2")!, titleCell: "Contact Us".localized()))
        moreCellItems.append(MoreDataModel(iconCell: UIImage(named: "IconMore3")!, titleCell: "Who Are We".localized()))
        moreCellItems.append(MoreDataModel(iconCell: UIImage(named: "IconMore4")!, titleCell: "Terms and Conditions".localized()))
        moreCellItems.append(MoreDataModel(iconCell: UIImage(named: "IconMore5")!, titleCell: "Language".localized()))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreCellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTVCell", for: indexPath) as! MoreTVCell
        let item = moreCellItems[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0: navigationController?.pushViewController(ReportsVC(), animated: true)
        case 1: navigationController?.pushViewController(ContactUsVC(), animated: true)
        case 2: navigationController?.pushViewController(WhoAreWeVC(), animated: true)
        case 3: navigationController?.pushViewController(TermsAndConditionsVC(), animated: true)
        case 4: changeLanguageCellPressed()
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // Change language action
    func changeLanguageCellPressed() {
        let changeLanguageVC = ChangeLanguageVC()
        changeLanguageVC.view.backgroundColor = UIColor.clear
        changeLanguageVC.view.isOpaque = false
        changeLanguageVC.modalPresentationStyle = .overFullScreen
        self.present(changeLanguageVC, animated: true)
    }
    
}
