//
//  MoreTVCell.swift
//  Shayal
//
//  Created by Moustafa Anas on 28/04/2022.
//

import UIKit

final class MoreTVCell: UITableViewCell {

    // MARK: - Identifying Vars
    @IBOutlet weak var moreImgCell: UIImageView!
    @IBOutlet weak var moreTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Cell Setup
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        moreImgCell.image = nil
        moreTitleLbl.text = nil
    }
    
    // Configure Cell
    func configureCell(item: MoreDataModel) {
        moreImgCell.image = item.iconCell
        moreTitleLbl.text = item.titleCell
    }
    
}
