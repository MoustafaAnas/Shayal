//
//  HomeVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 26/04/2022.
//

import UIKit
import FSPagerView
import MapKit
import CoreLocation

final class HomeVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var homeSlider: FSPagerView!
    @IBOutlet weak var addOrderBtn: UIButton!
    @IBOutlet weak var welcomeToAppLbl: UILabel!
    @IBOutlet weak var claryfingTxtLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var pageControl = FSPageControl()
    var sliderArr = [HomeSliderModel]()
    
    var locationManager = CLLocationManager()
    let deliveryLocation = CLLocationCoordinate2D(latitude: 30.037933, longitude: 31.381523)
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        
        setupMap()
        setupSlider()
        setupLocation()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = false
        addOrderBtn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
    }
    
    // MARK: - Buttons Actions
    @IBAction func addOrderBtnPressed(_ sender: Any) {
        navigationController?.pushViewController(AddOrderVC(), animated: true)
    }
    @IBAction func notificationsBtnPressed(_ sender: Any) {
        navigationController?.pushViewController(NotificationsVC(), animated: true)
    }
}


