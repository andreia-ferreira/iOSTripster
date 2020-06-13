//
//  AlamofireHelper.swift
//  Tripster
//
//  Created by Andreia on 12/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import Foundation
import Alamofire

struct AlamofireHelper {
    var headers: Dictionary<String, String> = [:]
    
    func getNearbyPlaces(latLng: String, type: String, radius: Int, completion: @escaping(_ result: GooglePlacesDefaultResponse?, _ error: String?) -> ()) {
        let query: [String : Any] = [
            "location": latLng,
            "radius": radius,
            "type": type,
            "key": GOOGLE_MAPS_KEY]

        AF.request(ApiEndpoints.getNearbyPlaces.url,
                   method: ApiEndpoints.getNearbyPlaces.httpMethod,
                   parameters: query)
            .validate()
            .responseDecodable(of: GooglePlacesDefaultResponse.self) { (response) in
                debugPrint(response)
                
                guard response.value != nil else {
                    completion(nil, "There was a problem while fetching the results, please try again later.")
                    return
                }
                
                guard response.value?.errorMessage == nil else {
                    completion(nil, response.value?.errorMessage)
                    return
                }
                
                guard response.value?.results != nil && (response.value?.results?.isEmpty == false) else {
                    completion(nil, "No results found.")
                    return
                }
                
                completion(response.value, nil)
            }
    }
    
}
