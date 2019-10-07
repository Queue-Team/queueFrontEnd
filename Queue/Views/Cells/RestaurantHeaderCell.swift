//
//  RestaurantHeaderCell.swift
//  Queue
//
//  Created by Jonathan Kopp on 10/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class RestaurantHeaderCell: UITableViewCell
{
    var imgView = UIImageView()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
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
        label.numberOfLines = 3
        return label
    }()
    var restaurant: ResaurantElement?
    override func layoutSubviews() {
        backgroundColor = .white
        imgView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 2)
        if let urlString = restaurant?.imageURL
        {
            print(urlString)
            imgView.downloaded(from: urlString, contentMode: .scaleToFill)
        }
//        imgView.layer.cornerRadius = 5
//        imgView.layer.masksToBounds = true
//        imgView.clipsToBounds = true
        addSubview(imgView)
        
        nameLabel.frame = CGRect(x: 2.5, y: frame.height / 2, width: frame.width - 5, height: 35)
        nameLabel.text = restaurant!.title
        addSubview(nameLabel)
        
        descriptionLabel.text = restaurant?.description
        let height = descriptionLabel.sizeThatFits(CGSize(width: frame.width  - 5, height: CGFloat.greatestFiniteMagnitude)).height
        descriptionLabel.frame = CGRect(x: 2.5, y: nameLabel.frame.maxY + 5, width: frame.width - 5, height: height)
        addSubview(descriptionLabel)
        selectionStyle = .none
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 0).cgPath
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

