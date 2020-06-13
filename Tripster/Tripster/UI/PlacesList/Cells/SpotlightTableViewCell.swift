//
//  SpotlightCellTableViewCell.swift
//  Tripster
//
//  Created by Andreia on 13/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import UIKit

class SpotlightTableViewCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
