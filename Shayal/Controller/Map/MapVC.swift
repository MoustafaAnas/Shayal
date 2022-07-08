//
//  MapVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.
//

import UIKit
import MapKit
import CoreLocation
import Cosmos

final class MapVC: UIViewController {
    
    // MARK: - Identifying Design Views

    let trackingContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.cornerRadius = 30
        view.shadowColor = .lightGray
        view.shadowRadius = 5
        view.shadowOpacity = 1
        return view
    }()
    
    let trackingTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "Almarai-Regular", size: 10)
        label.text = "Address To Deliver".localized()
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.mainColor
        label.font = UIFont(name: "Almarai-Regular", size: 12)
        label.setIcon(text: "Al-mansoura - Samia El-gamal".localized(), leftIcon: UIImage(named: "MsgStateImg")?.withTintColor(AppColor.mainColor))
        return label
    }()
    
    let deliveryInfoContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.textFieldBackground
        view.cornerRadius = 30
        view.shadowColor = .lightGray
        view.shadowRadius = 5
        view.shadowOpacity = 1
        return view
    }()
    
    let deliveryProfileImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle.fill")
        img.contentMode = .scaleAspectFill
        img.tintColor = AppColor.mainColor
        img.cornerRadius = img.frame.height/2
        return img
    }()
    
    let deliveryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Almarai-ExtraBold", size: 15)
        label.text = "Ahmed Mohamed Joe".localized()
        return label
    }()
    
    let deliveryRatingView: CosmosView = {
        let view = CosmosView()
        view.rating = 4
        view.settings.totalStars = 5
        view.settings.starSize = 15
        view.settings.starMargin = 3
        view.settings.filledImage = UIImage(named: "starFill")
        view.settings.emptyImage = UIImage(named: "starEmpty")
        view.settings.updateOnTouch = false
        return view
    }()
    
    let deliveryRatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.mainColor
        label.font = UIFont(name: "Almarai-Bold", size: 13)
        label.text = "4"
        return label
    }()
    
    let pinImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "pin")
        img.contentMode = .scaleAspectFill
        img.tintColor = .red
        img.cornerRadius = img.frame.height/2
        return img
    }()
    
    let selectLocationBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Select".localized(), for: .normal)
        btn.setGradientBackground(colorOne: AppColor.btnGradientColor, colorTwo: AppColor.mainColor)
        btn.backgroundColor = AppColor.mainColor
        btn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 15)
        btn.cornerRadius = 20
        return btn
    }()
    
    // MARK: - Identifying Vars
    
    var mapView: MKMapView!
    var location: CLLocation?
    var locationManager = CLLocationManager()
    var getOrderFromLocation: CLLocation? = nil
    var mapTitle = ""
    var getOrderFromText = ""
    var delegate : GetOrderFromDelegate?
    let deliveryLocation = CLLocationCoordinate2D(latitude: 30.037933, longitude: 31.381523)
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = mapTitle
        setupMapVC()
        customBackBtn()
        setupMapLocationManager()
        setupMapDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        customizeNavigationBar()
    }
}

