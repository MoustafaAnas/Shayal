//
//  OnBoardingVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 21/04/2022.
//

import UIKit

final class OnBoardingVC: UIViewController {

    // MARK: - Identifying Vars
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var onBoardingCV: UICollectionView!

    var onBoardingArr = [OnBoarding]()
    var currentCellIndex = 0
    
    // MARK: - ViewController Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        skipBtn.underline(text: "Skip".localized())
        mockData()
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        skipBtn.titleLabel?.font = UIFont(name: "Almarai-Bold", size: 12)
    }
    
    
    // MARK: - Buttons Actions
    @IBAction func skipBtnPressed(_ sender: Any) {
        let vc = UINavigationController(rootViewController: LoginVC())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    // MARK: - Mock Data
    func mockData() {
        onBoardingArr.append(OnBoarding(img: UIImage(named: "OnBoarding1")!, clarifyingQuestion: "So Confused, Don't know how to get your Orders?".localized(), clarifyingAnswer: "Example Text1 Example Text1 Example Text1 Example Text1 Example Text1 Example Text1 Example Text1 Example Text1".localized()))
        onBoardingArr.append(OnBoarding(img: UIImage(named: "OnBoarding2")!, clarifyingQuestion: "How could you think and Shayal is there?".localized(), clarifyingAnswer: "Example Text2 Example Text2 Example Text2 Example Text2 Example Text2 Example Text2 Example Text2 Example Text2".localized()))
        onBoardingArr.append(OnBoarding(img: UIImage(named: "OnBoarding3")!, clarifyingQuestion: "Choose everything you want from anywhere and just set your location".localized(), clarifyingAnswer: "Example Text3 Example Text3 Example Text3 Example Text3 Example Text3 Example Text3 Example Text3 Example Text3".localized()))
        onBoardingArr.append(OnBoarding(img: UIImage(named: "OnBoarding4")!, clarifyingQuestion: "Our delivery guy will get it very Quicklyyy".localized(), clarifyingAnswer: "Example Text4 Example Text4 Example Text4 Example Text4 Example Text4 Example Text4 Example Text4 Example Text4".localized()))
    }
}






