//
//  AppCoordinator.swift
//  MVVMRxSwiftRestaurants
//
//  Created by Faiçal Hasni on 5/10/20.
//  Copyright © 2020 Faiçal Hasni. All rights reserved.
//

import UIKit

class AppCoordinator {
    private var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {

        // DI
        let vc = RestaurantsViewController.instantiate(viewModel: RestaurantsListViewModel(service: RestaurantsService()))
        
        let navController = UINavigationController(rootViewController: vc)

        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
    }
}
