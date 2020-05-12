//
//  RestaurantViewModel.swift
//  MVVMRxSwiftRestaurants
//
//  Created by Faiçal Hasni on 5/12/20.
//  Copyright © 2020 Faiçal Hasni. All rights reserved.
//

import Foundation

class RestaurantViewModel {
    
    var displayText: String {
        get {
            return "\(restaurent.name) - \(restaurent.cuisine.rawValue.capitalized)"
        }
    }
    
    private let restaurent: Restaurant
    
    init(restaurent: Restaurant) {
        self.restaurent = restaurent
    }
    
}
