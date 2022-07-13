//
//  Home+DesginByCode.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension HomeVC {
    
    // apply gesture to map
    func customizeMapAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didMapPressed))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        mapView.addGestureRecognizer(gesture)
    }
    
    // Go to Tracking ,if user click on map
    @objc func didMapPressed() {
        let vc = MapVC()
        vc.mapTitle = "Track Order".localized()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // alert message
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Alert".localized(), message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close".localized(), style: .cancel))
        alert.addAction(UIAlertAction(title: "Settings".localized(), style: .default, handler: { action in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }))
        
        present(alert, animated: true)
    }
}
