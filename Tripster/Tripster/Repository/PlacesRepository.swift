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
        apiClient.getNearbyPlaces(latLng: latLng, type: type, radius: radius) { (response) in
            
            // check if response not null
            guard let _response = response else {
                completion(nil, "There was a problem while fetching the results, please try again later.")
                return
            }
            
            // Check if there are errors from alamofire
            guard _response.error == nil else {
                completion(nil, _response.error?.errorDescription ?? "Unknown Error")
                return
            }
            
            // Check for errors in the response
            guard _response.value?.errorMessage == nil && _response.value?.status == "OK" else {
                completion(nil, _response.value?.errorMessage ?? "There was a problem while fetching the results, please try again later.")
                return
            }
            
            // check if there are results
            guard _response.value?.results != nil && (_response.value?.results?.isEmpty == false) else {
                completion(nil, "No results found.")
                return
            }
            
            completion(_response.value, nil)
        }
    }
    
}
