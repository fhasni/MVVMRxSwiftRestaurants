//
//  RestaurantsListViewModel.swift
//  MVVMRxSwiftRestaurants
//
//  Created by Faiçal Hasni on 5/12/20.
//  Copyright © 2020 Faiçal Hasni. All rights reserved.
//

import Foundation
import RxSwift

final class RestaurantsListViewModel {
    
    let title = "Restaurants"
    private let service: RestaurantsServiceProtocol
    
    init(service: RestaurantsServiceProtocol) {
        self.service = service
    }
    
    func fetchRestaurautsViewModel() -> Observable<[RestaurantViewModel]> {
        return service.fetchRestaurants().map { $0.map { RestaurantViewModel(restaurent: $0) }}
    }
}
