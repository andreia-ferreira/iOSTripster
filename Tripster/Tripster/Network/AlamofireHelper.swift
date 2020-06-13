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
    
    func getNearbyPlaces(latLng: String, type: String, radius: Int, completion: @escaping(_ result: DataResponse<GooglePlacesDefaultResponse, AFError>?) -> ()) {
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
                completion(response)
            }
    }
    
}
