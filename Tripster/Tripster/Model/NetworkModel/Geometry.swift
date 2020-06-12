//
//  Geometry.swift
//  Tripster
//
//  Created by Andreia on 11/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import Foundation

struct Geometry: Codable {
    let location: Location?
    let viewport: Viewport?
}

struct Location: Codable {
    let lat, lng: Double
}

struct Viewport: Codable {
    let northeast, southwest: Location?
}
