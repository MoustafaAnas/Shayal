//
//  DoneOrdersCell.swift
//  Shayal
//
//  Created by Moustafa Anas on 27/04/2022.
//

import UIKit

final class DoneOrdersCell: UITableViewCell {

    // MARK: - Identifying Vars
    @IBOutlet weak var deliveryGuyImg: UIImageView!
    @IBOutlet weak var deliveryGuyName: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var transportType: UILabel!
    
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
        deliveryGuyImg.image = nil
        deliveryGuyName.text = nil
        orderPrice.text = nil
        transportType.text = nil
    }
    
    // Configure Cell
    func configureCell(item: OrdersModel) {
        deliveryGuyImg.image = item.deliveryGuyImg
        deliveryGuyName.text = item.deliveryName
        transportType.setIcon(text: item.transportType, leftIcon: UIImage(named: "car"))
        orderPrice.text = "\(item.orderPrice) " + "S.R".localized()
    }
}
