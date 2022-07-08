//
//  AddOrder+PickerView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit


extension AddOrderVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setupPickerView() {

        dataContainerPickerView.delegate = self
        dataContainerPickerView.dataSource = self
    }
    
    // No. of Sections in PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    //  No. of Items in Section
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return pickerViewArr.count
    }

    // Items Names in Section
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentIndex = row
        return pickerViewArr[row]
    }

    // Action After Selecting Item
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerViewArr {
        case packageTypePickerViewArr:
            packageTypeTextField.text = pickerViewArr[row]
        case vehicleTypePickerViewArr:
            vehicleTypeTxtField.text = pickerViewArr[row]
        case voucherPickerViewArr:
            voucherTxtField.text = pickerViewArr[row]
        case vehicleModelPickerViewArr:
            vehicleModelTxtField.text = pickerViewArr[row]
        default:
            break
            }
        }
    
    // choose current title and close pickerview
    @objc func closePickerView(txtField: UITextField) {
        txtField.text = pickerViewArr[currentIndex]
        view.endEditing(true)
    }
}
