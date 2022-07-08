//
//  EditProfileVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 29/04/2022.
//

import UIKit

final class EditProfileVC: UIViewController {

    // MARK: - Identifying Vars
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var bankTxtField: UITextField!
    @IBOutlet weak var bankAccountTxtField: UITextField!
    @IBOutlet weak var countryTxtField: UITextField!
    @IBOutlet weak var cityTxtField: UITextField!
    @IBOutlet weak var changePasswordTxtField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var pickerViewArr = [String]()
    let dataContainerPickerView = UIPickerView()
    var currentIndex = 0
    
    var bankPickerViewArr = ["Bank Misr".localized(), "QNB".localized(), "HSBC".localized()]
    var countryPickerViewArr = ["Egypt".localized(), "Morocco".localized(), "Qatar".localized()]
    var cityPickerViewArr = ["Mansoura".localized(), "Cairo".localized(), "Alex".localized()]
        
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Profile".localized()
        navigationItem.backButtonTitle = ""
        view.endEditing(true)
        localized()
        setupTextField()
        setupPickerView()
    }
    
    override func viewDidLayoutSubviews() {
        saveBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        saveBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
        cameraBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    }

    // MARK: - Buttons Actions
    @IBAction func cameraBtnPressed(_ sender: Any) {
        getPhoto(type: .photoLibrary)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        checkEditedDataValidation()
    }
}



 


