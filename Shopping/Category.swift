//
//  Category.swift
//  Shopping
//
//  Created by Josman Pérez Expósito on 04/05/2017.
//  Copyright © 2017 Teamtreehouse. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    dynamic var title = ""
    let items = List<Item>() // To many relationship to items
    
    static func loadCategories(in realm: Realm) throws {
        let categories = [
            Category(value: ["title":"Bakery"]),
            Category(value: ["title":"Canned Goods"]),
            Category(value: ["title":"Dairy"]),
            Category(value: ["title":"Drinks"]),
            Category(value: ["title":"Produce"]),
            Category(value: ["title":"Miscellaneous"])
        ]
        realm.beginWrite()
        for category in categories {
            realm.add(category)
        }
        try realm.commitWrite()
    }
}
