//
//  DoneCheckOutVC.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/9/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class DoneCheckOutVC: UIViewController {
    var orderNumber = Int()
    var orderLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        //label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func viewSafeAreaInsetsDidChange() {
        orderNumber = Int.random(in: 0...1000)
        orderLabel.frame = CGRect(x: 5, y: view.safeAreaInsets.top + 5, width: view.bounds.width - 10, height: 70)
        orderLabel.text = "\(orderNumber)"
        view.addSubview(orderLabel)
        descriptionLabel.frame = CGRect(x: 5, y:view.safeAreaInsets.top + 70, width: view.bounds.width - 10, height: view.bounds.height - (view.bounds.height * 0.5))
        descriptionLabel.text = "Your order has been received! You’ll be alerted when it’s ready. Simply show the server the above number, and you’ll receive your order!"
        view.addSubview(descriptionLabel)
    }
}
