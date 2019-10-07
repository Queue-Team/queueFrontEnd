//
//  RestaurantNetwork.swift
//  Queue
//
//  Created by Jonathan Kopp on 9/29/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
class RestaurantNetwork {
    public func fetchResaurants(completion: @escaping (Resaurant?) -> Void) {
        let url = urlBuilder()
        createResaurantModel(url: url) { (restuarant) in
            completion(restuarant)
        }
    }
    private func createResaurantModel(url: URL, completion: @escaping (_ response: Resaurant?) -> Void) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print(err.localizedDescription)
                completion(nil)
            }
            do {
                _ = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                //Updating UI keep on main thread!
                DispatchQueue.main.async {
                    let resaurants = try! JSONDecoder().decode(Resaurant.self, from: data!)
                    completion(resaurants)
                    
                }
            } catch {
                print("Error decoding resaurants model!")
                completion(nil)
            }
            }.resume()
    }
    
    private func urlBuilder()->URL{
        return URL(string: "https://q-backend-server-queueserving.vapor.cloud/restaurants")!
    }
}
