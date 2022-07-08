//
//  Map+DesignByCode.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit
import MapKit

extension MapVC {
    
    // MARK: - Setup Design Coded Frames
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        pinImage.frame = CGRect(x: view.frame.width/2 - 32, y: view.frame.height/2 - 32, width: 64, height: 64)
        
        trackingContainerView.frame = CGRect(x: 0, y: view.frame.height - 200, width: self.view.frame.width, height: 200)
        trackingTitleLabel.frame = CGRect(x: 47, y: 20, width: view.frame.width - 94, height: 10)
        addressLabel.frame = CGRect(x: 20, y: trackingTitleLabel.frame.maxY + 0, width: view.frame.width - 40, height: 25)
       
        setContainerDeliveryInfoApperance()
        
        selectLocationBtn.frame = CGRect(x: view.frame.width/2 - 130, y: view.frame.height - 150, width: 260, height: 40)
    }
    
    // Setup which data should appear depend on Viewcontroller Title
    func setupMapVC() {
        mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        self.view.addSubview(mapView)
        
        if title == "Get Package From".localized() {
            view.addSubview(pinImage)
            view.addSubview(selectLocationBtn)
            selectLocationBtn.addTarget(self, action: #selector(selectLocationBtnPressed), for: .touchUpInside)
        }
        
        else {
            drawDirectionFromUserLocationToDeliveryLocation()

            view.addSubview(trackingContainerView)
            trackingContainerView.addSubview(trackingTitleLabel)
            trackingContainerView.addSubview(addressLabel)
            
            trackingContainerView.addSubview(deliveryInfoContainerView)
            deliveryInfoContainerView.addSubview(deliveryProfileImg)
            deliveryInfoContainerView.addSubview(deliveryNameLabel)
            deliveryInfoContainerView.addSubview(deliveryRatingView)
            deliveryInfoContainerView.addSubview(deliveryRatingLabel)
        }
    }
    
    // select location button action
    @objc func selectLocationBtnPressed() {
        delegate?.getOrderFrom(location: getOrderFromText)
        navigationController?.popViewController(animated: true)
    }
    
    // customize NavigationBar Appearance
    func customizeNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.tintColor = .black
    }
    
    // Customize Back Button
    func customBackBtn() {
        let backBtn = UIBarButtonItem()
        backBtn.image = UIImage(systemName: "chevron.left".localized())
        backBtn.action = #selector(backBtnIsPressed)
        backBtn.target = self
        navigationItem.leftBarButtonItem = backBtn
    }
    
    // back Button Action
   @objc func backBtnIsPressed () {
       navigationController?.popViewController(animated: true)
    }
    
    // show alert message
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { action in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }))
        
        present(alert, animated: true)
    }
    
    // setup Delivery Info Apperance depends on language
    func setContainerDeliveryInfoApperance() {
        let currentLanguage = Locale.current.languageCode
        deliveryInfoContainerView.frame = CGRect(x: 0, y: addressLabel.frame.maxY + 15, width: view.frame.width, height: 130)

        if currentLanguage == "ar" {
            deliveryProfileImg.frame = CGRect(x: view.frame.width - 84, y: deliveryInfoContainerView.frame.height/2 - 32, width: 64, height: 64)
            deliveryNameLabel.frame = CGRect(x: 20, y: deliveryInfoContainerView.frame.height/2 - 25, width: view.frame.width - 114, height: 20)
            deliveryRatingView.frame = CGRect(x: view.frame.width - 180, y: deliveryInfoContainerView.frame.height/2, width: 90, height: 20)
            deliveryRatingLabel.frame = CGRect(x: view.frame.width - 205, y: deliveryInfoContainerView.frame.height/2, width: 20, height: 17)
        } else {
            deliveryProfileImg.frame = CGRect(x: 20, y: deliveryInfoContainerView.frame.height/2 - 32, width: 64, height: 64)
            deliveryNameLabel.frame = CGRect(x: deliveryProfileImg.frame.maxX + 12, y: deliveryInfoContainerView.frame.height/2 - 25, width: view.frame.width - 120, height: 20)
            deliveryRatingView.frame = CGRect(x: deliveryProfileImg.frame.maxX + 12, y: deliveryInfoContainerView.frame.height/2, width: 90, height: 20)
            deliveryRatingLabel.frame = CGRect(x: deliveryRatingView.frame.maxX + 5, y: deliveryInfoContainerView.frame.height/2, width: 20, height: 17)
        }
    }
}
