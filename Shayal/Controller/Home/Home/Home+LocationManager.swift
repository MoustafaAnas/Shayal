//
//  Home+LocationManager.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import CoreLocation

extension HomeVC: CLLocationManagerDelegate {

    // MARK: - Setup Location
    func setupLocation() {
        customizeMapAction()
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
        guard let location = locations.last else{return}
        addCustomAnnotationToMap(coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), title: "Me".localized())
        locationManager.stopUpdatingLocation()
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
    
    // Check if location authorization did not changed
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

