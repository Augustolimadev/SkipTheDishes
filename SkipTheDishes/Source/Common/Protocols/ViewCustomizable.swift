//
//  ViewCustomizable.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

import UIKit

/// Protocol to specifiy when a controller has a mainView with a custom class
/// use with typealias = <ICCustomView>
internal protocol ViewCustomizable: class {
    associatedtype CustomView
    
    var customView: CustomView { get }
}


extension ViewCustomizable where Self: UIViewController {
    
    var customView: CustomView {
        guard let customView = self.view as? CustomView else { fatalError("Can't load the View") }
        return customView
    }
}
