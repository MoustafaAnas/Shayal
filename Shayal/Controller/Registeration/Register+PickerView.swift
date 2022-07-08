//
//  Register+PickerView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension RegisterVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Setup PickerView
    func setupPickerView() {
        dataContainerPickerView.delegate = self
        dataContainerPickerView.dataSource = self
    }
    
    // No. of Sections in PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // No. of Items in Section
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
        if pickerViewArr == countryPickerViewArr {
            countryTxtField.text = pickerViewArr[row]
        }
        
        else {
            cityTxtField.text = pickerViewArr[row]
        }
    }
    
    // choose current title and close pickerview
    @objc func closePickerView(txtField: UITextField) {
        txtField.text = pickerViewArr[currentIndex]
        view.endEditing(true)
    }
}

