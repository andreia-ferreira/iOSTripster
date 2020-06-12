//
//  PlacesMapper.swift
//  Tripster
//
//  Created by Andreia on 12/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import Foundation

struct PlacesMapper {
    
    static func mapListPlaces(networkPlaces: [PlacesResult]?) -> [PlaceOfInterest] {
        var listPlaces: [PlaceOfInterest] = []
        if let _networkPlaces = networkPlaces {
            for place in _networkPlaces {
                listPlaces.append(mapPlace(place))
            }
        }
        return listPlaces
    }
    
    static func mapPlace(_ dto: PlacesResult) -> PlaceOfInterest {
        return PlaceOfInterest(placeId: dto.placeID ?? ""
            , name: dto.name ?? "Unknown",
              imageUrl: dto.photos?[0].photoReference ?? "",
              isOpen: dto.openingHours?.openNow,
              types: dto.types ?? [])
    }
    
}
