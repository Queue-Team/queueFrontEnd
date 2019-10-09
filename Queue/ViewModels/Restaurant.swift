//
//  Restaurant.swift
//  Queue
//
//  Created by Jonathan Kopp on 9/29/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation

struct ResaurantElement: Codable {
    let imageURL: String
    let menuItems: [MenuItem]
    let title, description: String
    let id: Int

}

// MARK: - MenuItem
struct MenuItem: Codable {
    let price: Double
    let description, title: String
    
}

typealias Resaurant = [ResaurantElement]
