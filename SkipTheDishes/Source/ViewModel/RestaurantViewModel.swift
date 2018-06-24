//
//  RestaurantViewModel.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

import UIKit

class RestaurantViewModel: UIViewController {
    private lazy var manager = RestaurantManager()
    
    override func viewDidLoad() {
        manager.getRestaurantList { (callback) in
            do {
                let data = try callback()
                print(data)
            } catch {
                print("Deu ruim")
            }
        }
    }
    
}
