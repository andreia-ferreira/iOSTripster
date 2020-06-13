//
//  SpotlightCollectionViewCell.swift
//  Tripster
//
//  Created by Andreia on 13/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import UIKit

class SpotlightCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setPlaceName(name: String) {
        placeName.text = name
    }
    
    func setPlaceImage(urlImage: String) {
        placeImage.setImageFromUrl(urlString: urlImage)
    }

}
