//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Лёпа on 01.05.2020.
//  Copyright © 2020 Lepa. All rights reserved.
//

import UIKit


struct Place {
    var name: String
    var location: String
    var type: String
    var image: String
    
    static let restaurantNames = ["Restor One",
                                  "Restor Two",
                                  "Restor Three",
                                  "Restor Four",
                                  "Restor Five"]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "N-city", type: "Restaurant", image: place))
        }
        
        return places
    }
}


