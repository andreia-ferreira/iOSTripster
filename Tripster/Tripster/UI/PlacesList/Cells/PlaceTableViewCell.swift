//
//  PlaceTableViewCell.swift
//  Tripster
//
//  Created by Andreia on 13/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setPlace(place: PlaceOfInterest) {
        nameLabel.text = place.name
        setupOpenState(place.isOpen)
        typesLabel.text = place.types.joined(separator: ", ").replacingOccurrences(of: "_", with: " ")
    }
    
    private func setupOpenState(_ state: Bool?) {
        switch state {
        case true:
            openLabel.text = "Open"
            openLabel.textColor = UIColor.green
        case false:
            openLabel.text = "Closed"
            openLabel.textColor = UIColor.red
        default:
            openLabel.text = "Unknown"
            openLabel.textColor = UIColor.brown
        }
    }
    
}
