//
//  HomeSlider.swift
//  Shayal
//
//  Created by Moustafa Anas on 27/04/2022.
//

import UIKit
import FSPagerView

final class HomeSlider: FSPagerViewCell {

    // MARK: - Identifying Vars
    @IBOutlet weak var sliderTitleLbl: UILabel!
    @IBOutlet weak var sliderContentLbl: UILabel!
    @IBOutlet weak var sliderImg: UIImageView!
    @IBOutlet weak var sliderContainerView: UIView!
    
    // MARK: - Cell Setup
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        sliderTitleLbl.text = nil
        sliderContentLbl.text = nil
        sliderImg.image = nil
        sliderContainerView.backgroundColor = nil
    }
    
    // Configure Cell
    func configureCell(item: HomeSliderModel) {
        sliderTitleLbl.text = item.title
        sliderContentLbl.text = item.content
        sliderImg.image = item.img
        sliderContainerView.backgroundColor = item.backgroundColor
    }
}
