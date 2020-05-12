//
//  Restaurant.swift
//  MVVMRxSwiftRestaurants
//
//  Created by Faiçal Hasni on 5/11/20.
//  Copyright © 2020 Faiçal Hasni. All rights reserved.
//

import Foundation


struct Restaurant: Decodable {
    var name: String
    var cuisine: Cuisine
}

enum Cuisine: String, Decodable{
    case european
    case french
    case indian
    case american
    case mexican
}
