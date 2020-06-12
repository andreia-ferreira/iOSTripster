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
    
    func getPlaces() {
        isLoading = true
        
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        AF.request(url,
                   method: .get,
                   parameters: ["location": "41.2053,-8.3305",
                                "type": "tourist_attraction",
                                "key": GOOGLE_MAPS_KEY,
                                "radius": "20000"])
            .validate()
            .responseDecodable(of: GooglePlacesDefaultResponse.self) { (response) in
                debugPrint(response)
                
                guard let placesResult = response.value else {
                    return
                }
                
                let listPlacesOfInterest = PlacesMapper.mapListPlaces(networkPlaces: placesResult.results)
                
                self.listPlaces = listPlacesOfInterest
                self.isLoading = false
            }
    }
    
}
