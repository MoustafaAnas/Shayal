//
//  LogoutVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 29/04/2022.
//

import UIKit
import Lottie
import ANActivityIndicator

final class LogoutVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var exclamationMarkAnimationView: AnimationView!
    @IBOutlet weak var logoutTitleLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        localized()
        customizeBlurViewAction()
        setupLottieAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        logoutBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        logoutBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
        cancelBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
    }

    // MARK: - Buttons Actions
    @IBAction func logoutBtnPressed(_ sender: Any) {
            showIndicator(message: "Loading...", messageTopMargin: 20, animationType: .ballRotateChase)
            let pref = UserDefaults.standard
            pref.removeObject(forKey: "phone")
            pref.removeObject(forKey: "token")
            pref.removeObject(forKey: "id")
            pref.removeObject(forKey: "email")
            pref.removeObject(forKey: "image")
            pref.removeObject(forKey: "name")
            pref.removeObject(forKey: "companyName")
            pref.removeObject(forKey: "commercialNumber")
            pref.removeObject(forKey: "licenceImage")
            pref.removeObject(forKey: "commercialImage")
            pref.removeObject(forKey: "address")
            pref.synchronize()
            Helper.restartApp()
            hideIndicator()
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Custom Functions
    func setupLottieAnimation() {
        exclamationMarkAnimationView.play()
        exclamationMarkAnimationView.loopMode = .loop
    }
    
    func customizeBlurViewAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCancelLogout))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        blurView.addGestureRecognizer(gesture)
    }
    
    @objc func didCancelLogout() {
        self.dismiss(animated: true)
    }

}
