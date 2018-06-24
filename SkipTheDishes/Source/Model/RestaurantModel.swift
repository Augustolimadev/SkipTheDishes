//
//  RestaurantModel.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

import Foundation
import UIKit

struct RestaurantModel {
    var restaurantId: Int
    var name: String
    var address: String
    var image: String
    
    init(restaurantId: Int, name: String, address: String, image: String) {
        self.restaurantId = restaurantId
        self.name = name
        self.address = address
        self.image = image
    }
    
    static func getModelSerialized(restaurants: Dictionary<String, [Dictionary<String, String>]>) -> [RestaurantModel] {
        var restaurantList: [RestaurantModel] = []
        
        if let allRestaurant = restaurants["restaurants"] {
            allRestaurant.forEach { (restaurant) in
                restaurantList.append(RestaurantModel.init(restaurantId: Int(restaurant["restaurantId"]!)!,
                                                           name: restaurant["name"]!,
                                                           address: restaurant["address"]!,
                                                           image: restaurant["image"]!))
            }
        }
        
        return restaurantList
    }
}
