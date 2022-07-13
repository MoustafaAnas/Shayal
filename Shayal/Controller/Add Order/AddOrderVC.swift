//
//  AddOrderVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 27/04/2022.
//

import UIKit
import CoreLocation

final class AddOrderVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var deliveryFromTxtField: UITextField!
    @IBOutlet weak var deliveryToTextField: UITextField!
    @IBOutlet weak var packageTypeTextField: UITextField!
    @IBOutlet weak var vehicleModelTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var vehicleTypeTxtField: UITextField!
    @IBOutlet weak var voucherTxtField: CustomDashedTextField!
    @IBOutlet weak var orderBtn: UIButton!
    
    var locationManager = CLLocationManager()
    var pickerViewArr = [String]()
    let dataContainerPickerView = UIPickerView()
    var currentIndex = 0
    
    var packageTypePickerViewArr = ["Electronics", "Food"]
    var vehicleModelPickerViewArr = ["2000", "2010", "2020"]
    var vehicleTypePickerViewArr = ["Sedan", "Hatchback", "Motocycle"]
    var voucherPickerViewArr = ["40%", "50%", "30%"]
    
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Order".localized()
        navigationItem.backButtonTitle = ""
        setupTextField()
        setupPickerView()
        
    }


    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        customizeNavBar(navBarimage: "NavBarBackground", navBarTintColor: .white, titleColor: .white)
    }
    
    override func viewDidLayoutSubviews() {
        orderBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
    }
    
    // MARK: - Buttons Actions
    @IBAction func orderBtnPressed(_ sender: Any) {
       checkOrderDataValidation()
    }
    
    // MARK: - Custom Functions
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Alert".localized(), message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close".localized(), style: .cancel))
        alert.addAction(UIAlertAction(title: "Settings".localized(), style: .default, handler: { action in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }))
        
        present(alert, animated: true)
    }
}



