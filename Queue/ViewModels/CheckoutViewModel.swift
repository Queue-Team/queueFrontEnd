//
//  CheckoutViewModel.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/9/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit
class CheckOutViewModel {
    var items: [MenuItem]?
    
    func numberOfSections()-> Int {
        if let i = items {
            return i.count + 1
        }
        return 0
    }
    func numberOfRows()->Int {
        return 1
    }
    func fetchAllItems() {
        items = Defaults().fetchCart()
    }
    func numberOfItems()->Int {
        if let i = items {
            return i.count
        }
        return 0
    }
    
    func calcTotalPrice()->Double{
        var total = Double.zero
        if(numberOfItems() == 0) {
            return 0.00
        }
        for i in items! {
            total += i.price
        }
        return total
    }
    func returnItem(index: Int)->MenuItem {
        return items![index]
    }
}
