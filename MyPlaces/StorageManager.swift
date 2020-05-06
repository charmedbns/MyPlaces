//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Лёпа on 06.05.2020.
//  Copyright © 2020 Lepa. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ place: Place) {
        try! realm.write {
            realm.add(place)
        }
    }
}