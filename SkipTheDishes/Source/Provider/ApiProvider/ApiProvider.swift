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
    
    // MARK: - Public Methods
    
    /// Calls the backend client request
    ///
    /// - Parameters:
    ///   - success: success call back
    ///   - failure: failure call back
    func request(opKey op: ApiProvider.Operation,
                 completion: @escaping ApiCompletion) {
        
        Alamofire.request(op.rawValue).response { (response) in
            print(response)
        }
        
//        Alamofire.request(op).response { response in // method defaults to `.get`
//            debugPrint(response)
//        }
        
//        backendClient.request(opKey: op.key, success: { (response) in
//            completion { try self.handle(response) }
//        }, failure: { (response) in
//            completion { try self.handle(response) }
//        })
    }
}
