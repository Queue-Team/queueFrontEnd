//
//  ItemDetailView.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class ItemDetailView: UIView {
    var item: MenuItem?
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        label.adjustsFontSizeToFitWidth = true
        label.text = ""
        label.textAlignment = .center
        label.numberOfLines = 1
        label.shadowColor = #colorLiteral(red: 0.328206782, green: 0.3553566551, blue: 0.3947986768, alpha: 1).withAlphaComponent(0.5)
        label.shadowOffset = CGSize(width: 1.05, height: 1.05)
        return label
    }()
    var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.text = ""
        label.textAlignment = .center
        label.numberOfLines = 1
        label.shadowColor = #colorLiteral(red: 0.328206782, green: 0.3553566551, blue: 0.3947986768, alpha: 1).withAlphaComponent(0.5)
        label.shadowOffset = CGSize(width: 1.05, height: 1.05)
        return label
    }()
    var addButton: UIButton = {
        let b = UIButton()
        b.setTitle("Add to order", for: .normal)
        b.backgroundColor =  #colorLiteral(red: 0.09029659377, green: 0.456161131, blue: 1, alpha: 1)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        b.titleLabel?.adjustsFontSizeToFitWidth = true
        b.layer.cornerRadius = 10
        b.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return b
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        nameLabel.frame = CGRect(x: 10, y: 0, width: bounds.width - 20, height: 32)
        nameLabel.text = item!.title
        addSubview(nameLabel)
        descLabel.text = item!.description
        let height = descLabel.sizeThatFits(CGSize(width: bounds.width - 5, height: CGFloat.greatestFiniteMagnitude)).height
        
        descLabel.frame = CGRect(x: 2.5, y: nameLabel.frame.maxY + 5, width: bounds.width - 5, height: height)
        addSubview(descLabel)
        
        priceLabel.frame = CGRect(x: 10, y: descLabel.frame.maxY + 10, width: bounds.width - 20, height: 32)
        priceLabel.text = "$\(item!.price)"
        addSubview(priceLabel)
        
        let width = bounds.width * 0.5
        addButton.frame = CGRect(x: (bounds.width / 2) - width / 2, y: priceLabel.frame.maxY + 20, width: width, height: 45)
        addSubview(addButton)
    }
    
    @objc func addButtonPressed() {
        print("Add item to order")
        Defaults().addItemToCart(item: item!)
    }
}
