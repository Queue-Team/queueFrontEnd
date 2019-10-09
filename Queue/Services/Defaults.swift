//
//  Defaults.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation

class Defaults {
    let userDefaults = Foundation.UserDefaults.standard
    func deleteAllItems() {
        userDefaults.removeObject(forKey: "cart")
    }
    func deleteItem(index: Int) {
        var allItemsStringArray = userDefaults.stringArray(forKey: "cart")
        if(allItemsStringArray!.count < index) {
            allItemsStringArray?.remove(at: index)
        }
        userDefaults.set(allItemsStringArray, forKey: "cart")
    }
    
    func addItemToCart(item: MenuItem) {
        let itemAsString = "\(item.title)~\(item.description)~\(item.price)"
        var allItems = userDefaults.stringArray(forKey: "cart")
        if allItems != nil {
            allItems?.append(itemAsString)
            userDefaults.set(allItems, forKey: "cart")
        } else {
             userDefaults.set([itemAsString], forKey: "cart")
        }
    }
    
    func fetchCart()->[MenuItem]?{
        var allItems: [MenuItem]?
        let allItemsStringArray = userDefaults.stringArray(forKey: "cart")
        if(allItemsStringArray != nil) {
            for stringItem in allItemsStringArray!{
                let arItem = stringItem.components(separatedBy: "~")
                print(arItem, arItem.count)
                let itemPrice = Double(arItem[2])
                let item = MenuItem(price: itemPrice!, description: arItem[1], title: arItem[0])
                if(allItems != nil) {
                    allItems!.append(item)
                }else {
                    allItems = [item]
                }
            }
        }
        return allItems
    }
}
