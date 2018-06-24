//
//  RestaurantsProvider.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

import Foundation

class RestaurantProvider {
}

extension RestaurantProvider: RestaurantProviderProtocol {
    func getRestaurantList(completionCallback: @escaping ApiCompletion) {
        ApiProvider.shared.request(opKey: .restaurants) { (result) in
            completionCallback { try result() }
        }
    }
}
