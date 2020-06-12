//
//  GooglePlacesDefaultResponse.swift
//  Tripster
//
//  Created by Andreia on 11/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import Foundation

struct GooglePlacesDefaultResponse: Codable {
    let nextPageToken: String?
    let results: [PlacesResult]?
    let status: String?
    let errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case nextPageToken = "next_page_token"
        case errorMessage = "error_message"
        case results, status
    }
}
