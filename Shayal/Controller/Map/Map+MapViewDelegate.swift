//
//  Map+MapViewDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import MapKit

extension MapVC: MKMapViewDelegate {
    
    // MARK: - Setup Map
    func setupMapDelegates() {
        mapView.delegate = self
    }
    
    func drawDirectionFromUserLocationToDeliveryLocation() {
        addCustomAnnotationToMap(coordinate: deliveryLocation, title: "Delivery".localized())
        
        if let userLoc = locationManager.location {
            drawDirection(startingLoc: deliveryLocation, destinationLoc: userLoc.coordinate)
        }
    }
    
    // Draw Direction from point to another point
    func drawDirection(startingLoc: CLLocationCoordinate2D, destinationLoc: CLLocationCoordinate2D) {
        let startingPlace = MKPlacemark(coordinate: startingLoc)
        let destinationPlace = MKPlacemark(coordinate: destinationLoc)
        
        let startingItem = MKMapItem(placemark: startingPlace)
        let destinationItem = MKMapItem(placemark: destinationPlace)
        
        let request = MKDirections.Request()
        request.source = startingItem
        request.destination = destinationItem
        request.transportType = .automobile
       // request.requestsAlternateRoutes = true
        
        let directions = MKDirections(request: request)
        directions.calculate { [weak self] response, error in
            guard let self = self else{return}
            guard let response = response else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            
            for route in response.routes {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    // Customize direction line
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .darkGray
       
        return render
    }
    
    // Add Custom Annotation
    func addCustomAnnotationToMap(coordinate: CLLocationCoordinate2D, title: String) {
        let pin = MKPointAnnotation()
        pin.title = title
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    // Customize Annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotaionView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "myCustomPin")
        switch annotation.title {
        case "Me".localized():
            annotaionView.markerTintColor = .orange
            annotaionView.glyphImage = UIImage(systemName: "person.fill")
            break
        case "Delivery".localized():
            annotaionView.markerTintColor = AppColor.backGroundColor
            annotaionView.glyphImage = UIImage(named: "ShippingPin")
            break
        default:
            print("Default")
        }
        return annotaionView
    }
    
    // MARK: - Getting Location Info
    // get location coordinate
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if title == "Get Package From".localized() {
            let newLocation = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
            if getOrderFromLocation == nil || getOrderFromLocation!.distance(from: newLocation) > 10 {
            getLocationInfo(location: newLocation)
            }
        }
    }
    
    // get location info
    func getLocationInfo(location: CLLocation) {
        if title == "Get Package From".localized() {
            getOrderFromLocation = location
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(location) { [weak self] places, error in
                guard let self = self else{return}
                guard let place = places?.first, error == nil else{return}
                
                self.getOrderFromText = "\(place.name ?? "") / \(place.locality ?? "") / \(place.administrativeArea ?? "") / \(place.country ?? "")"
                print(self.getOrderFromText)
            }
        }
    }
}
