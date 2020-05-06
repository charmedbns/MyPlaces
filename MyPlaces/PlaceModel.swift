//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Лёпа on 01.05.2020.
//  Copyright © 2020 Lepa. All rights reserved.
//

import RealmSwift

class Place: Object {
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    
    let restaurantNames = ["Restor One",
                                  "Restor Two",
                                  "Restor Three",
                                  "Restor Four",
                                  "Restor Five"]
    
     func savePlaces() {
        
        for place in restaurantNames {
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
            
            let newPlace = Place()
            newPlace.name = place
            newPlace.location = "N-City"
            newPlace.type = "bar"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
        }
    }
}
