//
//  ChangeLanguage+TextFieldDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension ChangeLanguageVC: UITextFieldDelegate {
    
    // MARK: - Setup TextFields
    func setupTextField() {
        
        setTextFieldIcon()
        
        arabicLangTxtField.setPadding()
        englishLangTxtField.setPadding()
        
        arabicLangTxtField.delegate = self
        englishLangTxtField.delegate = self
        
        addTxtFieldAction()
    }
    
    // Add Icon to TextField
    func setTextFieldIcon() {
        let currentLanguage = Locale.current.languageCode
        switch currentLanguage{
        case "ar":
            arabicLangTxtField.addRightIcon(icon: UIImage(named: "rightTick")!, tintColor: .black)
            englishLangTxtField.addRightIcon(icon: UIImage(), tintColor: .white)
           
        case "en":
            englishLangTxtField.addRightIcon(icon: UIImage(named: "rightTick")!, tintColor: .black)
            arabicLangTxtField.addRightIcon(icon: UIImage(), tintColor: .white)
            
        default:
            break
        }
    }
    
    // Add TextField Action
    func addTxtFieldAction(){
        arabicLangTxtField.addTarget(self, action: #selector(self.textFieldDidPressed(_:)), for: UIControl.Event.editingDidBegin)
        englishLangTxtField.addTarget(self, action: #selector(self.textFieldDidPressed(_:)), for: UIControl.Event.editingDidBegin)
    }
    
    // After pressing TextField, do the following action
    @objc func textFieldDidPressed(_ textField: UITextField) {
   
            switch textField{
            case arabicLangTxtField:
                arabicLangTxtField.addRightIcon(icon: UIImage(named: "rightTick")!, tintColor: .black)
                englishLangTxtField.addRightIcon(icon: UIImage(), tintColor: .white)
                newLanguage = "ar"
               
            case englishLangTxtField:
                englishLangTxtField.addRightIcon(icon: UIImage(named: "rightTick")!, tintColor: .black)
                arabicLangTxtField.addRightIcon(icon: UIImage(), tintColor: .white)
                newLanguage = "en"
                
            default:
                break
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.endEditing(true)
    }
    
}
