//
//  RegisterVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 24/04/2022.
//

import UIKit

final class RegisterVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var registerBenefitsLbl: UILabel!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var countryTxtField: UITextField!
    @IBOutlet weak var cityTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var haveAccountAlreadyLbl: UILabel!
    
    let dataContainerPickerView = UIPickerView()
    var currentIndex = 0
    
    var countryPickerViewArr = ["Egypt".localized(), "Morocco".localized(), "Qatar".localized()]
    var cityPickerViewArr = ["Masnoura".localized(), "Cairo".localized(), "Alex".localized(), "Aswan".localized(), "Giza".localized()]
    var pickerViewArr = [String]()
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "Sign up".localized()
        navigationItem.backButtonTitle = ""

        setupTextField()
        setupPickerView()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        signinBtn.underline()
    }
    
    override func viewDidLayoutSubviews() {
        registerBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        signinBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 12)
    }
    // MARK: - Buttons Actions
    @IBAction func registerBtnPressed(_ sender: Any) {
        checkRegisterValidation()
    }
    
    @IBAction func signinBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}



