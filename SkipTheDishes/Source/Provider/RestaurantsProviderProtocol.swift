//
//  RestaurantsProviderProtocol.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

protocol RestaurantProviderProtocol {
    func getRestaurantList(completionCallback: @escaping ApiCompletion)
}
