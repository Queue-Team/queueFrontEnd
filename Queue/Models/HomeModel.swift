//
//  HomeViewModel.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/9/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class HomeModel: NSObject, UITableViewDataSource {
    var viewModel = HomeViewModel()
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RestaurantCell()
        cell.restaurant = viewModel.restaurants[indexPath.section]
        return cell
    }
}

