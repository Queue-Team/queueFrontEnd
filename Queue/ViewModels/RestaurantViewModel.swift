//
//  RestaurantViewModel.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/9/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit
class RestaurantViewModel {
    var restaurant: ResaurantElement?
    
    func numberOfSections()->Int {
        return (restaurant?.menuItems.count)!
    }
    func numberOfRows() ->Int {
        return 1
    }
    func getRestaurant()->ResaurantElement {
        return restaurant!
    }
    func getItem(index: Int)->MenuItem {
        return (restaurant?.menuItems[index])!
    }

}
