//
//  RestaurantsService.swift
//  MVVMRxSwiftRestaurants
//
//  Created by Faiçal Hasni on 5/11/20.
//  Copyright © 2020 Faiçal Hasni. All rights reserved.
//

import RxSwift

import Foundation

protocol RestaurantsServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class RestaurantsService : RestaurantsServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]> {
        
        return Observable.create { observer -> Disposable in
            
            let restaurantsFileName = "Restaurants"
            
            guard let path = Bundle.main.path(forResource: restaurantsFileName, ofType: "json") else {
                observer.onError(NSError(domain: "\(restaurantsFileName) not found", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
            } catch(let err) {
                observer.onError(err)
            }
            
             return Disposables.create { }

        }
        
    }
}
