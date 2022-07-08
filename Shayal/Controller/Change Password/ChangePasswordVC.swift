//
//  ChangePasswordVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import UIKit
import ANActivityIndicator
import FTIndicator

final class ChangePasswordVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var changePasswordVCTitleLbl: UILabel!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var changePasswordTitleLbl: UILabel!
    @IBOutlet weak var newPasswordTxtField: UITextField!
    @IBOutlet weak var confirmNewPasswordTxtField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        localized()
        customizeBlurViewAction()
        setupTextField()
    }
    
    override func viewDidLayoutSubviews() {
        saveBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        saveBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
    }

    // MARK: - Buttons Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        checkNewPasswordValidation()
    }
    
    // MARK: - Custom Functions
    func customizeBlurViewAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCancelChangePassword))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        blurView.addGestureRecognizer(gesture)
    }
    
    @objc func didCancelChangePassword() {
        self.dismiss(animated: true)
    }
}

