//
//  RestaurantsBusiness.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

import Foundation

typealias GetRestaurantsListBusinessCallback = (_ completion:() throws -> ([RestaurantModel]) ) -> Void

class RestaurantBusiness {
    
    lazy var provider: RestaurantProviderProtocol = RestaurantProvider()
    
    func getRestaurantList(callback: @escaping GetRestaurantsListBusinessCallback) {
        self.provider.getRestaurantList() { result in
            do {
                guard let resultData = try result() else {
                    throw BusinessError.noElements
                }
                
                guard let restaurantJSON = try JSONSerialization.jsonObject(with: resultData, options: []) as? Dictionary<String, [Dictionary<String, String>]> else {
                    throw BusinessError.parseJson
                }
                
                let restaurants = RestaurantModel.getModelSerialized(restaurants: restaurantJSON)
                
                callback { restaurants }
            } catch {
                callback { throw error }
            }
        }
    }
}
