//
//  Photo Message.swift
//  Shayal
//
//  Created by Moustafa Anas on 04/05/2022.
//

import MessageKit

class PhotoMessage: NSObject, MediaItem {
    
    var url: URL?
    var image: UIImage?
    var placeholderImage: UIImage
    var size: CGSize
    
    init(path: String) {
        self.url = URL(fileURLWithPath: path)
        self.placeholderImage = UIImage(named: "gallery_placeholder.png")!
        self.size = CGSize(width: 240, height: 240)
    }
}
