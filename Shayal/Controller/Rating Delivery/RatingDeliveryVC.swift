//
//  RatingDeliveryVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 28/04/2022.
//

import UIKit
import Cosmos
import FTIndicator

final class RatingDeliveryVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var ratingBlurView: UIVisualEffectView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var ratingDeliveryVCTitleLbl: UILabel!
    @IBOutlet weak var deliveryGuyImg: UIImageView!
    @IBOutlet weak var deliveryGuyName: UILabel!
    @IBOutlet weak var rateBtn: UIButton!
    @IBOutlet weak var ratingTextView: UITextView!
    
    var deliveryRate = 0.0
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        localized()
        customizeBlurViewAction()
        didRatedDelivery()
        setupTextView()
    }
    
    override func viewDidLayoutSubviews() {
        rateBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        rateBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
    }

    // MARK: - Buttons Actions
    @IBAction func closeRatingBtnPressed(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: false)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rateBtnPressed(_ sender: Any) {
        if deliveryRate != 0.0 {
            FTIndicator.showSuccess(withMessage: "Thank you for helping us improving our services quality".localized(), image: UIImage(named: "ThankYou"), userInteractionEnable: false)
            self.presentingViewController?.presentingViewController?.dismiss(animated: false)
            self.dismiss(animated: true, completion: nil)
        }
        
        else {
            FTIndicator.showInfo(withMessage: "Please rate our Delivery".localized())
        }
    }
    
    // MARK: - Custom Functions
    func didRatedDelivery() {
        ratingView.didFinishTouchingCosmos = { rating in
            self.deliveryRate = rating
            print(self.deliveryRate)
        }
    }
    
    // MARK: - Custom Functions
    func customizeBlurViewAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCancelRatingView))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        ratingBlurView.addGestureRecognizer(gesture)
    }
    
    @objc func didCancelRatingView() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: false)
        self.dismiss(animated: true, completion: nil)
    }

}

