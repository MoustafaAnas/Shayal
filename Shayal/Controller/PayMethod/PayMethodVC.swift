//
//  PayMethodVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 28/04/2022.
//

import UIKit
import Lottie

final class PayMethodVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var payMethodTitleLbl: UILabel!
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var payWithCreditCardRadioBtn: UIButton!
    @IBOutlet weak var payWithCashRadioBtn: UIButton!
    @IBOutlet weak var payWithTitleLbl: UILabel!
    @IBOutlet weak var payWithTitle2Lbl: UILabel!
    @IBOutlet weak var creditCardTitleLbl: UILabel!
    @IBOutlet weak var cashTitleLbl: UILabel!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        localized()
        customizeBlurViewAction()
        lottieAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        nextBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        nextBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
    }

    // MARK: - Buttons Actions
    @IBAction func payWithCreditBtnPressed(_ sender: Any) {
        payWithCashRadioBtn.backgroundColor = .white
        payWithCreditCardRadioBtn.backgroundColor = AppColor.mainColor
    }
    
    @IBAction func payWithCashBtnPressed(_ sender: Any) {
        payWithCashRadioBtn.backgroundColor = AppColor.mainColor
        payWithCreditCardRadioBtn.backgroundColor = .white
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
        if payWithCashRadioBtn.backgroundColor == AppColor.mainColor || payWithCreditCardRadioBtn.backgroundColor == AppColor.mainColor {
            let vc = RatingDeliveryVC()
            vc.view.backgroundColor = UIColor.clear
            vc.view.isOpaque = false
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
        
        else {
            
        }
    }
    
    // MARK: - Custom Functions
    func lottieAnimation() {
        animationView.play()
        animationView.loopMode = .loop
    }
    
    func customizeBlurViewAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCancelPayMethod))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        blurView.addGestureRecognizer(gesture)
    }
    
    @objc func didCancelPayMethod() {
        self.dismiss(animated: true)
    }

}
