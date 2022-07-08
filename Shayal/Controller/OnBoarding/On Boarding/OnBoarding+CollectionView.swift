//
//  OnBoarding+CollectionView.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Setup CollectionView
    func setupCollectionView() {
        onBoardingCV.delegate = self
        onBoardingCV.dataSource = self
        onBoardingCV.register(UINib(nibName: "onBoardingCVCell", bundle: nil) , forCellWithReuseIdentifier: "onBoardingCVCell")
    }
    
    // Setup CollectionView Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardingArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onBoardingCVCell", for: indexPath) as! onBoardingCVCell
        let item = onBoardingArr[indexPath.row]
        cell.configureCell(item: item)
        cell.nextBtn.tag = indexPath.row
        cell.nextBtn.addTarget(self, action: #selector(nextBtnIsPressed), for: .touchUpInside)
        return cell
    }
    
    // Setup CollectionView Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: - Cell Button Action
    @objc func nextBtnIsPressed(sender: UIButton) {
        
        let indexpath = IndexPath(row: sender.tag, section: 0)
        currentCellIndex = indexpath.row + 1
        
        if currentCellIndex < onBoardingArr.count {
            onBoardingCV.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        } else {
            let vc = UINavigationController(rootViewController: LoginVC())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}
