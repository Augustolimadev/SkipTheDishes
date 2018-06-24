//
//  RequestNames.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

/// Request names
///
/// - shopwindow: Shopwindow

import Alamofire

typealias ApiCompletion = (() throws -> Data?) -> Void

/// Api Provider to manage backend access
internal class ApiProvider {
    
    enum Operation: String {
        case restaurants = "http://apimockery.com/mock/Q3ZazN"
        
        var key: String {
            return self.rawValue
        }
    }
    
    // MARK: Shared Instance
    
    private static var unShared: ApiProvider? = ApiProvider()
    static var shared: ApiProvider {
        guard let instance = unShared else {
            unShared = ApiProvider()
            return unShared!
        }
        return instance
    }
    
    
    func request(opKey op: ApiProvider.Operation,
                 completion: @escaping ApiCompletion) {
        
        Alamofire.request(URL(string: op.rawValue)!).responseData { (response) in
            completion { response.result.value }
        }
    }
}
