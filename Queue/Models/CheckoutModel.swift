//
//  CheckoutModel.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/9/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class CheckoutModel: NSObject, UITableViewDataSource {
    var viewModel = CheckOutViewModel()
    func setup() {
        viewModel.fetchAllItems()
    }
    func isNotEmpty() ->Bool {
        return viewModel.numberOfItems() != 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == viewModel.numberOfItems()) {
            let cell = CheckOutCell()
            cell.price = viewModel.calcTotalPrice()
            cell.checkoutButton.addTarget(self, action: #selector(checkOutPressed), for: .touchUpInside)
            return cell
        }
        let cell = RestaurantItemCell()
        cell.item = viewModel.returnItem(index: indexPath.section)
        return cell
    }
    
    @objc func checkOutPressed() {
        print("Model Checkout Pressed")
        Defaults().deleteAllItems()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "checkout"), object: nil)
        
    }
}
