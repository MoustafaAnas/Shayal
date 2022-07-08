//
//  NewPasswordVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 24/04/2022.
//

import UIKit
import FTIndicator
import ANActivityIndicator

final class NewPasswordVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var newPasswordTitleLbl: UILabel!
    @IBOutlet weak var clarifyingPasswordProbetiesLbl: UILabel!
    @IBOutlet weak var newPasswordTxtField: UITextField!
    @IBOutlet weak var confirmNewPasswordTxtField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "New Password".localized()
        navigationItem.backButtonTitle = ""
        
        localized()
        customBackBtn()
        setupInterfaceDesign()
        setupTextField()
    }

    override func viewDidLayoutSubviews() {
        saveBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
    }
    
    // MARK: - Buttons Actions
    @IBAction func saveBtnPressed(_ sender: Any) {
        guard let password = newPasswordTxtField.text, !password.isEmpty, password.count > 5 else{
            FTIndicator.showError(withMessage: "Enter Valid New Password".localized())
            return
        }
            if password != confirmNewPasswordTxtField.text  {
                FTIndicator.showError(withMessage: "Yor new password does not match confirm password".localized())
            return
        }
        
        showIndicator(message: "Loading...".localized(), messageTopMargin: 20, animationType: .ballRotateChase)
        navigationController?.popToRootViewController(animated: true)
        FTIndicator.showSuccess(withMessage: "Password Changed Successfully".localized())
        hideIndicator()
    }
    
    // MARK: - Custom Functions
    func setupInterfaceDesign() {
        newPasswordTxtField.attributedPlaceholder = NSAttributedString(string: "New Password".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        confirmNewPasswordTxtField.attributedPlaceholder = NSAttributedString(string: "Confirm New Password".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        saveBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
    }
}

