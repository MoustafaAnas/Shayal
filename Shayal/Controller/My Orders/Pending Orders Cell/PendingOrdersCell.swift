//
//  PendingOrdersCell.swift
//  Shayal
//
//  Created by Moustafa Anas on 27/04/2022.
//

import UIKit

final class PendingOrdersCell: UITableViewCell {

    // MARK: - Identifying Vars
    @IBOutlet weak var deliveryPhoto: UIImageView!
    @IBOutlet weak var deliveryGuyName: UILabel!
    @IBOutlet weak var getOrderFrom: UILabel!
    @IBOutlet weak var deliverOrderTo: UILabel!
    @IBOutlet weak var packageType: UILabel!
    @IBOutlet weak var packageWeight: UILabel!
    @IBOutlet weak var vehicleType: UILabel!
    @IBOutlet weak var directionArrowImg: UIImageView!
    
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
        deliveryPhoto.image = nil
        deliveryGuyName.text = nil
        getOrderFrom.text = nil
        deliverOrderTo.text = nil
        packageType.text = nil
        packageWeight.text = nil
        vehicleType.text = nil
        directionArrowImg.image = nil
    }
    
    // Configure Cell
    func configureCell(item: PendingOrdersModel) {
        deliveryPhoto.image = item.deliveryGuyImg
        deliveryGuyName.text = item.deliveryName
        getOrderFrom.setIcon(text: item.getOrderFrom, leftIcon: UIImage(named: "LocationPin"))
        directionArrowImg.image = UIImage(systemName: "arrow.right".localized())
        deliverOrderTo.setIcon(text: item.deliverTo, leftIcon: UIImage(named: "LocationPin"))
        packageType.setIcon(text: item.packageType, leftIcon: UIImage(named: "package"))
        packageWeight.setIcon(text: "\(item.packageWeight) " + "Kilo".localized(), leftIcon: UIImage(named: "kg"))
        vehicleType.setIcon(text: item.vehicleType, leftIcon: UIImage(named: "car"))
    }
    
}
