//
//  PlacesRepository.swift
//  Tripster
//
//  Created by Andreia on 12/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import Foundation

class PlacesRepository {
    
    let apiClient = AlamofireHelper()
    
    func getNetworkPlaces(latLng: String, type: String, radius: Int, completion: @escaping(_ result: GooglePlacesDefaultResponse?, _ error: String?) -> ()) {
        apiClient.getNearbyPlaces(latLng: latLng, type: type, radius: radius) { (response, error) in
            completion(response, error)
        }
    }
    
}
