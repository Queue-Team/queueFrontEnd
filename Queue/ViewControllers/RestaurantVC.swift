//
//  RestaurantVC.swift
//  Queue
//
//  Created by Jonathan Kopp on 9/29/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class RestaurantVC: UIViewController {
    
    var restaurant:ResaurantElement?
    var tableView = UITableView()
    var itemView = ItemDetailView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = restaurant!.title
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        tableViewSetup()
    }
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(tableView)
    }
    
}
extension RestaurantVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return (restaurant?.menuItems.count)! + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0) {
            return view.bounds.height * 0.3
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            let cell = RestaurantHeaderCell()
            cell.restaurant = restaurant
            return cell
        }
        let cell = RestaurantItemCell()
        cell.item = restaurant!.menuItems[indexPath.section - 1]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0) {
            return 0
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0) {
            return
        }
        let item = restaurant?.menuItems[indexPath.section - 1]
        itemView = ItemDetailView()
        itemView.item = item
        itemView.addButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        itemView.frame = CGRect(x: 2.5, y: view.bounds.height, width: view.bounds.width - 5, height: view.bounds.height)
        view.addSubview(itemView)
        UIView.animate(withDuration: 0.35, animations: {
            self.itemView.frame = CGRect(x: 2.5, y: self.view.safeAreaInsets.top, width: self.view.bounds.width - 5, height: self.view.bounds.height)
           }, completion: { (finished: Bool) in
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelPressed))
        })
    }
    @objc func cancelPressed() {
        
        UIView.animate(withDuration: 0.35, animations: {
            self.itemView.frame = CGRect(x: 0, y: self.itemView.bounds.height, width: self.itemView.bounds.width, height: self.itemView.bounds.height)
        }, completion: { (finished: Bool) in
            self.itemView.removeFromSuperview()
            self.navigationItem.rightBarButtonItem = .none
        })
    }
}

