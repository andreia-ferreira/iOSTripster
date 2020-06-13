//
//  ApiEndpoints.swift
//  Tripster
//
//  Created by Andreia on 12/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import Foundation
import Alamofire

enum ApiEndpoints {
    case getNearbyPlaces
    
    var url: String {
        get {
            switch self {
            case .getNearbyPlaces:
                return BASE_URL + "place/nearbysearch/json"
            }
        }
    }
    
    var httpMethod: HTTPMethod {
        get {
            switch self {
            case .getNearbyPlaces:
                return .get
            }
        }
    }
    
}
