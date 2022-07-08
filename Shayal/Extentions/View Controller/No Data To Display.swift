//
//  No Data To Display.swift
//  Shayal
//
//  Created by Moustafa Anas on 06/05/2022.
//

import Foundation
import UIKit

let errorMsgLbl = UILabel()
let imgErrorPhoto = UIImageView()

extension UIViewController {
   
    func noDataToDisplayMsg(tableview:UITableView, tableViewDataArrCount: Int, tintColor: UIColor, msg: String) {
       
        
        errorMsgLbl.frame = CGRect(x: 50, y: 250, width: self.view.frame.width - 100, height: 200)
        
        if tableViewDataArrCount == 0 {
            tableview.isHidden = true

            errorMsgLbl.text = msg
            errorMsgLbl.textColor = tintColor
            errorMsgLbl.textAlignment = .center
            self.view.addSubview(errorMsgLbl)
        } else {
            errorMsgLbl.isHidden = true
            tableview.isHidden = false
        }
    }
    
    func noDataToDisplayMsgWithImage(tableview:UITableView, tableViewDataArrCount: Int, image: String = "icloud.slash", tintColor: UIColor, msg: String) {
        
        imgErrorPhoto.frame = CGRect(x: 50, y: 250, width: self.view.frame.width - 100, height: 240)
        errorMsgLbl.frame = CGRect(x: imgErrorPhoto.frame.minX, y: imgErrorPhoto.frame.maxY + 15, width: imgErrorPhoto.frame.width, height: 30)
        
        if tableViewDataArrCount == 0 {
            tableview.isHidden = true
            imgErrorPhoto.isHidden = false
            errorMsgLbl.isHidden = false
            imgErrorPhoto.image = UIImage(systemName: image)
            imgErrorPhoto.tintColor = tintColor
            self.view.addSubview(imgErrorPhoto)
            

            errorMsgLbl.text = msg
            errorMsgLbl.textColor = tintColor
            errorMsgLbl.textAlignment = .center
            self.view.addSubview(errorMsgLbl)
        }
        else {
            imgErrorPhoto.isHidden = true
            errorMsgLbl.isHidden = true
            tableview.isHidden = false
        }
    }
}
