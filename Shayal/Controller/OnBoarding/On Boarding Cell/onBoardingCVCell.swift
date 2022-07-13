//
//  onBoardingCVCell.swift
//  Shayal
//
//  Created by Moustafa Anas on 22/04/2022.
//

import UIKit


final class onBoardingCVCell: UICollectionViewCell {

    // MARK: - Identifying Vars
    
    @IBOutlet weak var onBoardingImg: UIImageView!
    @IBOutlet weak var claryfingQuestionLbl: UILabel!
    @IBOutlet weak var claryfingAnswerLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    // MARK: - Cell ViewController Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(item: OnBoarding) {
        onBoardingImg.image = item.img
        claryfingQuestionLbl.text = item.clarifyingQuestion
        claryfingAnswerLbl.text = item.clarifyingAnswer
    }
}
