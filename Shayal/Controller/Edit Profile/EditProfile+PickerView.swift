//
//  EditProfile+PickerView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension EditProfileVC: UIPickerViewDelegate, UIPickerViewDataSource {

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
        switch pickerViewArr {
        case countryPickerViewArr:
            countryTxtField.text = pickerViewArr[row]
        case cityPickerViewArr:
            cityTxtField.text = pickerViewArr[row]
        case bankPickerViewArr:
            bankTxtField.text = pickerViewArr[row]
        default: break
        }
    }
        
    // choose current title and close pickerview
    @objc func closePickerView(txtField: UITextField) {
        txtField.text = pickerViewArr[currentIndex]
        view.endEditing(true)
    }
}
