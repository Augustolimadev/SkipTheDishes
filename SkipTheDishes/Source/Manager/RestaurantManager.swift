//
//  RestaurantManager.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

import Foundation

typealias GetRestaurantListCallback = (_ completion:() throws -> ([RestaurantModel])) -> Void

class RestaurantManager {
    
    private var business = RestaurantBusiness()
    
    /// get restaurant list
    func getRestaurantList(completionCallback: @escaping GetRestaurantListCallback) {
        self.business.getRestaurantList() { (completion) in
            do {
                let data = try completion()
                completionCallback { data }
            } catch {
                completionCallback { throw error }
            }
        }
    }
}
