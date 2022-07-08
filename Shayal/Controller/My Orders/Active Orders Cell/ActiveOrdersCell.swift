//
//  ActiveOrdersCell.swift
//  Shayal
//
//  Created by Moustafa Anas on 27/04/2022.
//

import UIKit

final class ActiveOrdersCell: UITableViewCell {

    // MARK: - Identifying Vars
    @IBOutlet weak var deliveryGuyImg: UIImageView!
    @IBOutlet weak var deliveryGuyName: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var transportType: UILabel!
    @IBOutlet weak var orderState: UILabel!
    @IBOutlet weak var cancelOrderBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    
    // MARK: - Cell Setup
    override func awakeFromNib() {
        super.awakeFromNib()
        cancelOrderBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 12)
        cancelOrderBtn.underline(text: "Cancel Order".localized())
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
        orderState.text = nil
        cancelOrderBtn.setTitle(nil, for: .normal)
    }
    
    // Configure Cell
    func configureCell(item: OrdersModel) {
        deliveryGuyImg.image = item.deliveryGuyImg
        deliveryGuyName.text = item.deliveryName
        transportType.setIcon(text: item.transportType, leftIcon: UIImage(named: "car"))
        orderPrice.text = "\(item.orderPrice) " + "S.R".localized()
        orderState.text = item.orderState
      
    }
}
