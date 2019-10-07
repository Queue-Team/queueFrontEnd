//
//  ViewController.swift
//  Queue
//
//  Created by Jonathan Kopp on 9/29/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var restaurants = Resaurant()
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Defaults().deleteItem(index: 0)
        //Defaults().deleteAllItems()
        // Do any additional setup after loading the view.
        self.navigationController?.setUpWithStyle(color: Colors.blue, title: "Restaurants")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.checkoutPressed))
        tableViewSetup()
        RestaurantNetwork().fetchResaurants() { (restaurants) in
            if let restaurantsUnwrapped = restaurants {
                print("✅ Restaurants unwrapped")
                self.restaurants = restaurantsUnwrapped
                self.tableView.reloadData()
            }
            
        }
        
    }
    
    func tableViewSetup() {
        tableViewHeaderSetUp()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(tableView)
    }
    @objc func checkoutPressed() {
        let vc = CheckoutVC()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return restaurants.count
    }
    
    func tableViewHeaderSetUp() {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.text = "Restaurants near you!"
        label.textAlignment = .center
        label.frame = CGRect(x: 5, y: 5, width: view.bounds.width - 20, height: 35)
        self.tableView.tableHeaderView = label
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = restaurants[indexPath.section].description
        let height = label.sizeThatFits(CGSize(width: view.bounds.width / 2 - 5, height: CGFloat.greatestFiniteMagnitude)).height
        return height + 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RestaurantCell()
        cell.restaurant = restaurants[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RestaurantVC()
        vc.restaurant = restaurants[indexPath.section]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

