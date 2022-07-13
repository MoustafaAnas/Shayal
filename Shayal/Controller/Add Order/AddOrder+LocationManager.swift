//
//  AddOrder+LocationManager.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import CoreLocation

extension AddOrderVC: CLLocationManagerDelegate {
    
    // MARK: - Setup Location
    func getUserLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if isLocationServiceEnabled() {
            checkAuthorization()
        } else {
            showAlert(msg: "Please Enable Location Service".localized())
        }
    }
    
    // get user current location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print(location.coordinate)
            getLocationInfo(location: location)
            locationManager.stopUpdatingLocation()
        }
    }
    
    // get user current location info
    func getLocationInfo(location: CLLocation) {
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { [weak self] places, error in
            guard let self = self else{return}
            guard let place = places?.first, error == nil else{return}
            self.deliveryToTextField.text = "\(place.name ?? "") / \(place.locality ?? "") / \(place.administrativeArea ?? "") / \(place.country ?? "")"
        }
    }
    
    // Check if Location Service Enabled
    func isLocationServiceEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    // Check current user location authorization
    func checkAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            showAlert(msg: "Authorization Restricted".localized())
            break
        case .denied:
            showAlert(msg: "Please Enable Access to Location".localized())
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        default:
            print("Default")
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .denied:
            showAlert(msg: "Please Enable Access to Location".localized())
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        default:
            print("Default")
            break
        }
    }
}
