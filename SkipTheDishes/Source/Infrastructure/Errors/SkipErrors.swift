//
//  SkipErrors.swift
//  SkipTheDishes
//
//  Created by Augusto Cunha Lima on 24/06/2018.
//  Copyright © 2018 Augusto Cunha Lima. All rights reserved.
//

import Foundation

enum BusinessError: Error {
    case parse(String)
    case parseJson(Decodable.Type)
    case noElements
}
