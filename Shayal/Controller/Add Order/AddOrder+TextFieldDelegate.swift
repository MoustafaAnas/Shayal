//
//  AddOrder+TextFieldDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit
import IQKeyboardManagerSwift

extension AddOrderVC: UITextFieldDelegate {
    
    // MARK: - Setup TextFields

    func setupTextField() {
        deliveryFromTxtField.setPadding()
        deliveryToTextField.setPadding()
        packageTypeTextField.setPadding()
        vehicleModelTxtField.setPadding()
        weightTxtField.setPadding()
        vehicleTypeTxtField.setPadding()
        voucherTxtField.setPadding()
        
        deliveryToTextField.addRightIcon(icon: UIImage(named: "location")!, tintColor: AppColor.mainColor)
        deliveryFromTxtField.addRightIcon(icon: UIImage(named: "location")!, tintColor: AppColor.mainColor)
        packageTypeTextField.addRightIcon(icon: UIImage(named: "down-filled-main-color")!, tintColor: AppColor.mainColor)
        vehicleModelTxtField.addRightIcon(icon: UIImage(named: "down-filled-main-color")!, tintColor: AppColor.mainColor)
        weightTxtField.addRightIcon(icon: UIImage(systemName: "cube.box.fill")!, tintColor: AppColor.mainColor)
        vehicleTypeTxtField.addRightIcon(icon: UIImage(named: "down-filled-main-color")!, tintColor: AppColor.mainColor)
                
        deliveryToTextField.delegate = self
        deliveryFromTxtField.delegate = self
        packageTypeTextField.delegate = self
        vehicleModelTxtField.delegate = self
        weightTxtField.delegate = self
        vehicleTypeTxtField.delegate = self
        voucherTxtField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        switch textField {
        case packageTypeTextField: pickerViewArr = packageTypePickerViewArr
        case vehicleModelTxtField: pickerViewArr = vehicleModelPickerViewArr
        case vehicleTypeTxtField:  pickerViewArr = vehicleTypePickerViewArr
        case voucherTxtField: pickerViewArr = voucherPickerViewArr
        default:
            break
        }

        dataContainerPickerView.reloadAllComponents()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textFieldTracer()
        switch textField {
            case deliveryFromTxtField:
                //deliveryToTextField.becomeFirstResponder()
            view.endEditing(true)
                let vc = MapVC()
                vc.mapTitle = "Get Package From".localized()
                vc.delegate = self
                navigationController?.pushViewController(vc, animated: true)
            
            case deliveryToTextField: getUserLocation()
            
            case packageTypeTextField:
            textField.inputView = dataContainerPickerView
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(closePickerView(txtField:)))
            
            case vehicleModelTxtField:
            textField.inputView = dataContainerPickerView
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(closePickerView(txtField:)))
            
            case vehicleTypeTxtField:
            textField.inputView = dataContainerPickerView
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(closePickerView(txtField:)))
                        
            case voucherTxtField:
            textField.inputView = dataContainerPickerView
            textField.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(closePickerView(txtField:)))
            
            default:
                break
        }
       }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setPadding()
    }
   
}

