//
//  HomeViewModel.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/9/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit
class HomeViewModel {
    var restaurants = Resaurant()
    
    func fetchRestaurants(completion: @escaping (Resaurant?) -> Void) {
        RestaurantNetwork().fetchResaurants() { (restaurants) in
            if let restaurantsUnwrapped = restaurants {
                print("✅ Restaurants unwrapped")
                self.restaurants = restaurantsUnwrapped
                completion(self.restaurants)
            }
            
        }
    }
    func numberOfSections()->Int {
        return restaurants.count
    }
    func numberOfRows() ->Int {
        return 1
    }
    func heightForRow(section: Int)->CGFloat {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = restaurants[section].description
        let height = label.sizeThatFits(CGSize(width: UIScreen.main.bounds.width / 2 - 5, height: CGFloat.greatestFiniteMagnitude)).height
        return height + 80
    }
}
