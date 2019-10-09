//
//  CheckOutCell.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/9/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class CheckOutCell: UITableViewCell
{
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    var checkoutButton: UIButton = {
        let b = UIButton()
        b.setTitle("Check out", for: .normal)
        b.backgroundColor = Colors.blue
        b.layer.cornerRadius = 15
        return b
    }()
    var desc = String()
    var price = Double()
    override func layoutSubviews() {
        backgroundColor = .clear
        
        priceLabel.frame = CGRect(x: 5, y: 10, width: frame.width - 10, height: 35)
        priceLabel.text = "Total price: $\(price)"
        addSubview(priceLabel)
        
        let buttonWidth = frame.width * 0.4
        checkoutButton.frame = CGRect(x: frame.width / 2 - (buttonWidth / 2), y: priceLabel.frame.maxY + 20, width: buttonWidth, height: 50)
        addSubview(checkoutButton)
        selectionStyle = .none
    }
    
    @objc func checkOutPressed() {
        
        print("Button Triggerd")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "checkout"), object: nil)
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

