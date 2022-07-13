//
//  ActivationCodeVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 23/04/2022.
//

import UIKit
import FTIndicator
import ANActivityIndicator

final class ActivationCodeVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var nxtBtn: UIButton!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input4: UITextField!
    @IBOutlet weak var input5: UITextField!
    @IBOutlet weak var changePhoneNumberBtn: UIButton!
    
    var codeVerification:String = ""
    var timer: Timer?
    var seenTimer = 59
    var phoneNumber = ""
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title  = "ِِActivation Code".localized()
        navigationItem.backButtonTitle = ""
        
        setupTxtFieldDelegates()
        addTxtFieldAction()
        startTimer()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupInterfaceDesign()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
               input1.becomeFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        nxtBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
        changePhoneNumberBtn.titleLabel?.font = UIFont(name: "Almarai-Regular", size: 12)
    }
    
    // MARK: - Buttons Actions
    @IBAction func nextBtnPressed(_ sender: Any) {
        
        getCodeVerification()
        showIndicator(message: "Loading...".localized(), messageTopMargin: 20, animationType: .ballRotateChase)
        if codeVerification != "" && codeVerification.count == 5 {
            hideIndicator()
            FTIndicator.showSuccess(withMessage: "Code Verfied".localized())
            navigationController?.pushViewController(NewPasswordVC(), animated: true)
            self.resetCodeVerfication()
        } else {
            hideIndicator()
            FTIndicator.showError(withMessage: "Enter Verfication Code".localized())
        }
    }
    
    @IBAction func changePhoneNumberBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Custom Functions
    func setupInterfaceDesign() {
        timerLbl.text = "01:00"
        seenTimer = 59
        nxtBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        changePhoneNumberBtn.underline()
    }
    
    // Getting Code Verfication
    func getCodeVerification() {
       codeVerification.append(input1.text!)
       codeVerification.append(input2.text!)
       codeVerification.append(input3.text!)
       codeVerification.append(input4.text!)
       codeVerification.append(input5.text!)
       
       self.view.endEditing(true)
    }
    
    // Reset CodeVerification Inputs
    func resetCodeVerfication () {
            self.input1.text = ""
            self.input2.text = ""
            self.input3.text = ""
            self.input4.text = ""
            self.input5.text = ""
            self.codeVerification = ""
            self.input1.becomeFirstResponder()
            seenTimer = 59
    }
}




