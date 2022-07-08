//
//  NotificationsCell.swift
//  Shayal
//
//  Created by Moustafa Anas on 02/05/2022.
//

import UIKit

final class NotificationsCell: UITableViewCell {

    // MARK: - Identifying Vars
    @IBOutlet weak var deliveryNameLbl: UILabel!
    @IBOutlet weak var notificationsContentLbl: UILabel!
    @IBOutlet weak var isCompleted: UIView!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Cell Setup
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        deliveryNameLbl.text = nil
        notificationsContentLbl.text = nil
        containerView.backgroundColor = nil
    }
    
    // Configure Cell
    func configureCell(item: NotificationsDataModel) {
        deliveryNameLbl.text = item.userName
        notificationsContentLbl.text = item.notificationMsg
        
        if !item.isCompleted {
            isCompleted.isHidden = false
            containerView.backgroundColor = UIColor(red: 230/255, green: 246/255, blue: 246/255, alpha: 1)
        }
        
        else {
            isCompleted.isHidden = true
            containerView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        }
    }
    
}
