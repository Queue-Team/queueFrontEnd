//
//  RestaurantModel.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/9/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class RestaurantModel: NSObject, UITableViewDataSource {
    var viewModel = RestaurantViewModel()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            let cell = RestaurantHeaderCell()
            cell.restaurant = viewModel.getRestaurant()
            return cell
        }
        let cell = RestaurantItemCell()
        cell.item = viewModel.getItem(index: indexPath.section - 1)
        return cell
    }
}
