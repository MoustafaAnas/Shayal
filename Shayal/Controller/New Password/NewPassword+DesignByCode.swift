//
//  NewPassword+DesignByCode.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension NewPasswordVC {
    
    // custom Back Button
    func customBackBtn() {
        let backBtn = UIBarButtonItem()
        backBtn.image = UIImage(systemName: "chevron.left".localized())
        backBtn.action = #selector(backBtnIsPressed)
        backBtn.target = self
        navigationItem.leftBarButtonItem = backBtn
    }
    
    // Back Button Action
   @objc func backBtnIsPressed () {
       navigationController?.popToRootViewController(animated: true)
    }
}
