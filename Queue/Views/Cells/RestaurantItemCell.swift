//
//  RestaurantItemCell.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class RestaurantItemCell: UITableViewCell
{
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    var item: MenuItem?
    override func layoutSubviews() {
        backgroundColor = .white
        
        nameLabel.frame = CGRect(x: 2.5, y: frame.height / 2 - 15, width: frame.width * 0.65, height: 30)
        nameLabel.text = item!.title
        addSubview(nameLabel)
        
        priceLabel.frame = CGRect(x: nameLabel.frame.maxY, y: frame.height / 2 - 15, width: frame.width - nameLabel.frame.maxY, height: 30)
        priceLabel.text = "$\(item!.price)"
        addSubview(priceLabel)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

