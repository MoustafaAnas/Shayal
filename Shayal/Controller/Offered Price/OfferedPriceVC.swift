//
//  OfferedPriceVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import UIKit

final class OfferedPriceVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var offeredPriceVCTitleLbl: UILabel!
    @IBOutlet weak var deliveryProfilePic: UIImageView!
    @IBOutlet weak var deliveryNameLbl: UILabel!
    @IBOutlet weak var approveOfferBtn: UIButton!
    @IBOutlet weak var refuseOfferBtn: UIButton!
    @IBOutlet weak var deliveryRatingTitleLbl: UILabel!
    @IBOutlet weak var deliveryRating: UILabel!
    @IBOutlet weak var offeredPriceTitleLbl: UILabel!
    @IBOutlet weak var offredPriceLbl: UILabel!
    @IBOutlet weak var timeToDeliverTitleLbl: UILabel!
    @IBOutlet weak var timeToDeliverLbl: UILabel!
    @IBOutlet weak var distanceByKMTitleLbl: UILabel!
    @IBOutlet weak var distanceByKMLbl: UILabel!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeBlurViewAction()
    }
    
    override func viewDidLayoutSubviews() {
        approveOfferBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        containerView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        approveOfferBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
        refuseOfferBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
    }
    
    // MARK: - Buttons Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func approveBtnPressed(_ sender: Any) {
        let vc = RatingDeliveryVC()
        vc.view.backgroundColor = UIColor.clear
        vc.view.isOpaque = false
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    @IBAction func refuseBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Custom Functions
    func customizeBlurViewAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCancelOfferedPrice))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        blurView.addGestureRecognizer(gesture)
    }
    
    @objc func didCancelOfferedPrice() {
        self.dismiss(animated: true)
    }
}
