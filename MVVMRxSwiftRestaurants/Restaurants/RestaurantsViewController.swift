//
//  RestaurentsViewController.swift
//  MVVMRxSwiftRestaurants
//
//  Created by Faiçal Hasni on 5/10/20.
//  Copyright © 2020 Faiçal Hasni. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RestaurantsViewController: UIViewController {
    
    private let bag = DisposeBag()
    private var viewModel: RestaurantsListViewModel!
    @IBOutlet weak var tableView: UITableView!

    static func instantiate(viewModel: RestaurantsListViewModel) -> RestaurantsViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(identifier: "RestaurantsViewController") as! RestaurantsViewController
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide lines in tableView
        tableView.tableFooterView = UIView()
        
        // title
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        
        // load restaurants
        viewModel.fetchRestaurautsViewModel().observeOn(MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "RestaurautCell")) { _ , viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }
        .disposed(by: bag)

    }


}

