//
//  CheckoutVC.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class CheckoutVC: UIViewController {
    
    var items: [MenuItem]?
    var tableView = UITableView()
    var itemView = ItemDetailView()
    var dataSource = CheckoutModel()
    override func viewWillAppear(_ animated: Bool) {
        dataSource.setup()
        if(dataSource.isNotEmpty()){
            tableViewSetup()
        }
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(checkoutNow), name: NSNotification.Name(rawValue: "checkout"), object: nil)
        view.backgroundColor = .white
        title = "Cart"
        
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        dataSource.setup()
        if(dataSource.isNotEmpty()){
            tableViewSetup()
        }
    }
    
    
    @objc func checkoutNow() {
        self.navigationController?.pushViewController(DoneCheckOutVC(), animated: true)
    }
    
}
extension CheckoutVC: UITableViewDelegate {
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(tableView)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == dataSource.viewModel.numberOfItems()) {
            return 150
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0) {
            return 0
        } else if section == items?.count{
            return 30
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

