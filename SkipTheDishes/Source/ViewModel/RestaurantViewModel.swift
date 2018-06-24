//
//  RestaurantViewModel.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

import UIKit

let restaurantCell = "restaurantCell"

class RestaurantViewModel: UIViewController, ViewCustomizable {
    typealias CustomView = RestaurantView
    
    private lazy var manager = RestaurantManager()
    var restaurantList: [RestaurantModel] = []
    
    override func viewDidLoad() {
        manager.getRestaurantList { (callback) in
            do {
                let data = try callback()
                self.restaurantList = data
                self.customView.restaurantsTableView.reloadData()
            } catch {
                print("I will finish if have time :)")
            }
        }
    }
    
}

extension RestaurantViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = restaurantList[indexPath.row]
        var cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: restaurantCell)!
        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.address
//        cell.imageView?.image = restaurant.name
        
        return cell
    }
    
}
