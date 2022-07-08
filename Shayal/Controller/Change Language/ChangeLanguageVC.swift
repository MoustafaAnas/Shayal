//
//  ChangeLanguageVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 29/04/2022.
//

import UIKit
import FTIndicator

final class ChangeLanguageVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var changeLanguageTitleLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var chooseLanguageTitleLbl: UILabel!
    @IBOutlet weak var arabicLangTxtField: UITextField!
    @IBOutlet weak var englishLangTxtField: UITextField!
    
    var newLanguage: String?
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        localized()
        customizeBlurViewAction()
        setupTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        saveBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        saveBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
    }

    // MARK: - Buttons Actions
    @IBAction func closeVCBtnPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        didChangeLanguage()
    }
    
    // MARK: - Custom Functions
    // Change Language button Action
    func didChangeLanguage() {
        let currentLanguage = Locale.current.languageCode
        guard let newLang = self.newLanguage, newLang != currentLanguage else{
            FTIndicator.showToastMessage("English is your current language, please choose another one".localized())
            return
        }
        
        let alertController = UIAlertController(title: "Restart Application".localized(), message: "To change language you need to reopen the application".localized(), preferredStyle: .alert)

        let retartAction = UIAlertAction(title: "Close".localized(), style: UIAlertAction.Style.default) {
            UIAlertAction in
            UserDefaults.standard.setValue([newLang], forKey: "AppleLanguages")
            exit(0)
        }
        alertController.addAction(retartAction)
        present(alertController, animated: true)
    }
    
    // Set Gesture To Blur View
    func customizeBlurViewAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCancelChangeLanguage))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        blurView.addGestureRecognizer(gesture)
    }
    
    // Set Action to the Gesture of Blur View
    @objc func didCancelChangeLanguage() {
        self.dismiss(animated: true)
    }
}
