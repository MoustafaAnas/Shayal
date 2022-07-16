//
//  AddReportVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 29/04/2022.
//

import UIKit
import FTIndicator

final class AddReportVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var addReportTitleLbl: UILabel!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var reportContentTxtView: UITextView!
    @IBOutlet weak var reportBtn: UIButton!
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeBlurViewAction()
        userNameTxtField.textFieldTracer()
        setupTextView()
    }
    
    override func viewDidLayoutSubviews() {
        reportBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
    }

    // MARK: - Buttons Actions
    @IBAction func closeVCBtnPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func reportBtnIsPressed(_ sender: Any) {
        guard let reportTxt = reportContentTxtView.text, !reportTxt.isEmpty, reportTxt != "Report Text", reportTxt.count > 10 else {
            FTIndicator.showToastMessage("Please enter your complain, to solve it as fast as possible".localized())
            return
        }
        FTIndicator.showInfo(withMessage: "We recieved your complain, and we will contact you soon with the latest updates".localized())
        self.dismiss(animated: true)
    }
    
    // MARK: - Custom Functions
    // Set Gesture To Blur View
    func customizeBlurViewAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCancelAddReport))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        blurView.addGestureRecognizer(gesture)
    }
    
    // Set Action to gesture
    @objc func didCancelAddReport() {
        self.dismiss(animated: true)
    }
}


