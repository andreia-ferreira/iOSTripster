//
//  OpeningHours.swift
//  Tripster
//
//  Created by Andreia on 11/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import Foundation

struct OpeningHours: Codable {
    let openNow: Bool?

    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
}
