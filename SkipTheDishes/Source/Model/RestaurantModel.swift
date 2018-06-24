//
//  RestaurantModel.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

import Foundation
import UIKit

struct RestaurantModel: Codable {
    var restaurantId: Int
    var name: String
    var address: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case restaurantId
        case name
        case address
        case image
    }
}

struct RestaurantModelWrapper: Codable {
    var data: RestaurantModel?
}
