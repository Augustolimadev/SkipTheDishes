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
                
                guard let restaurantsModelWrapper = try? JSONDecoder().decode(RestaurantModelWrapper.self, from: resultData) else {
                    throw BusinessError.parseJson(RestaurantModel.self)
                }
                
                guard let restaurants = restaurantsModelWrapper.data else {
                    throw BusinessError.noElements
                }
                
//                if restaurants.count == 0 {
//                    throw BusinessError.noElements
//                } else {
//                    callback { restaurants }
//                }
                
                callback { [restaurants] }
            } catch {
                callback { throw error }
            }
        }
    }
}



