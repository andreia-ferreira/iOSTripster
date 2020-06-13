//
//  SpotlightCellTableViewCell.swift
//  Tripster
//
//  Created by Andreia on 13/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import UIKit

class SpotlightTableViewCell: UITableViewCell {
    
    @IBOutlet weak var placesCollectionView: UICollectionView!
    var spotlightItems: [PlaceOfInterest] = [] {
        didSet {
            placesCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        let bundle = Bundle(identifier: BUNDLE_IDENTIFIER)
        let cell = UINib(nibName: "SpotlightCollectionViewCell", bundle: bundle)
        self.placesCollectionView.register(cell, forCellWithReuseIdentifier: "SpotlightCollectionViewCell")
        placesCollectionView.dataSource = self
    }
    
}

extension SpotlightTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = placesCollectionView.dequeueReusableCell(withReuseIdentifier: "SpotlightCollectionViewCell", for: indexPath) as! SpotlightCollectionViewCell
        
        cell.setPlaceName(name: spotlightItems[indexPath.row].name)
        cell.setPlaceImage(urlImage: spotlightItems[indexPath.row].imageUrl) 
        
        return cell
    }
    
}

extension SpotlightTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 150)
    }
}
