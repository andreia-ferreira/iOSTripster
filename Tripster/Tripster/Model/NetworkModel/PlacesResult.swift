//
//  PlacesResult.swift
//  Tripster
//
//  Created by Andreia on 11/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import Foundation

struct PlacesResult: Codable {
    let geometry: Geometry?
    let icon: String?
    let id, name: String?
    let openingHours: OpeningHours?
    let photos: [Photo]?
    let placeID: String?
    let rating: Double?
    let reference: String?
    let types: [String]?
    let userRatingsTotal: Int?
    let vicinity: String?

    enum CodingKeys: String, CodingKey {
        case geometry, icon, id, name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case rating, reference, types
        case userRatingsTotal = "user_ratings_total"
        case vicinity
}
}
