//
//  Home+PagerView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit
import FSPagerView

extension HomeVC: FSPagerViewDelegate, FSPagerViewDataSource {
    
    // MARK: - Setup PagerView
    func setupSlider() {
        homeSlider.delegate = self
        homeSlider.dataSource = self
        homeSlider.register(UINib(nibName: "HomeSlider", bundle: nil), forCellWithReuseIdentifier: "HomeSlider")
        
        mockData()
        customizePageController()
    }

    func mockData() {
        sliderArr.append(HomeSliderModel(title: "New Offer?".localized(), content: "Example Text Example Text ".localized(), img: UIImage(named: "sliderImg")!, backgroundColor: .white))
        sliderArr.append(HomeSliderModel(title: "New Offer2?".localized(), content: "Example Text Example Text ".localized(), img: UIImage(named: "sliderImg")!, backgroundColor: .yellow))
        sliderArr.append(HomeSliderModel(title: "New Offer3?".localized(), content: "Example Text Example Text ".localized(), img: UIImage(named: "sliderImg")!, backgroundColor: .blue))
        sliderArr.append(HomeSliderModel(title: "New Offer4?".localized(), content: "Example Text Example Text ".localized(), img: UIImage(), backgroundColor: .green))
    }
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return sliderArr.count
    }
        
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "HomeSlider", at: index) as! HomeSlider
        let item = sliderArr[index]
        cell.configureCell(item: item)
        pageControl.currentPage = index
        
        return cell
    }
    
    // Custom Page Control
    func customizePageController() {
        pageControl = FSPageControl(frame: CGRect(x: 40, y: homeSlider.frame.maxY + 15, width: 0, height: 0))
        self.view.addSubview(pageControl)
        pageControl.numberOfPages = sliderArr.count
        pageControl.currentPage = 0
        pageControl.contentHorizontalAlignment = .center
        pageControl.setFillColor(.lightGray, for: .normal)
        pageControl.setFillColor(AppColor.mainColor, for: .selected)
    }
}
