//
//  ViewController.swift
//  Queue
//
//  Created by Jonathan Kopp on 9/29/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit

class HomeVC: UIViewController{
    var tableView = UITableView()
    var dataSource = HomeModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setUpWithStyle(color: Colors.blue, title: "Restaurants")
        let item = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-shopping-cart-30"), style: .plain, target: self, action:  #selector(self.checkoutPressed))
        self.navigationItem.rightBarButtonItem = item
        tableViewSetup()
        dataSource.viewModel.fetchRestaurants(){_ in
            self.tableView.reloadData()
        }
        
    }
    
    
    @objc func checkoutPressed() {
        let vc = CheckoutVC()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension HomeVC: UITableViewDelegate {
    
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

    func tableViewSetup() {
        tableViewHeaderSetUp()
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataSource.viewModel.heightForRow(section: indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RestaurantVC()
        vc.dataSource.viewModel.restaurant = dataSource.viewModel.restaurants[indexPath.section]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
