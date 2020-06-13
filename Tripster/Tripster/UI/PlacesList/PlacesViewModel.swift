//
//  PlacesViewModel.swift
//  Tripster
//
//  Created by Andreia on 11/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import Foundation
import Alamofire

class PlacesViewModel {
    
    let typePlace = "tourist_attraction"
    lazy var repository : PlacesRepository = {
        return PlacesRepository()
    }()
    
    var loadingClosure : ((Bool) -> ())?
    private var isLoading: Bool = true {
        didSet {
            self.loadingClosure?(isLoading)
        }
    }
    
    var listPlacesClosure : (([PlaceOfInterest]) -> ())?
    private var listPlaces: [PlaceOfInterest] = [PlaceOfInterest]() {
        didSet {
            self.listPlacesClosure?(listPlaces)
        }
    }
    
    var errorClosure : ((String) -> ())?
    private var errorMessage: String = String() {
        didSet {
            self.errorClosure?(errorMessage)
        }
    }
    
    func getPlaces() {
        isLoading = true
        
        self.repository.getNetworkPlaces(latLng: "41.2053, -8.3305", type: typePlace, radius: 20000) { (response, error) in
            guard error == nil else {
                self.errorMessage = error ?? "Unknown error"
                return
            }
            
            if let placesResult = response?.results {
                let mappedPlaces = PlacesMapper.mapListPlaces(networkPlaces: placesResult)
                self.listPlaces = mappedPlaces
                self.isLoading = false
            }
            
        }
    }
    
}
