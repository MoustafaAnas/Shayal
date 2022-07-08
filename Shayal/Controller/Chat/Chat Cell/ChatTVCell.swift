//
//  ChatTVCell.swift
//  Shayal
//
//  Created by Moustafa Anas on 28/04/2022.
//

import UIKit

final class ChatTVCell: UITableViewCell {

    // MARK: - Identifying Vars
    @IBOutlet weak var senderProfilePic: UIImageView!
    @IBOutlet weak var senderUserNameLbl: UILabel!
    @IBOutlet weak var msgShortcutLbl: UILabel!
    @IBOutlet weak var isOnlineView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Cell Setup
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        senderProfilePic.image = nil
        senderUserNameLbl.text = nil
        msgShortcutLbl.text = nil
        containerView.backgroundColor = nil
    }
    
    // Configure Cell
    func configureCell(item: ChatDataModel) {
        senderProfilePic.image = item.profilePicture
        senderUserNameLbl.text = item.userName
        msgShortcutLbl.text = item.shortMsg
        
        if item.IsOnline {
            isOnlineView.isHidden = false
            containerView.backgroundColor = UIColor(red: 230/255, green: 246/255, blue: 246/255, alpha: 1)
        }
        
        else {
            isOnlineView.isHidden = true
            containerView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        }
    }
}
