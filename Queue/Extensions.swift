//
//  Extensions.swift
//  Queue
//
//  Created by Jonathan Kopp on 9/29/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit
extension UINavigationController{
    func setUpWithStyle(color: UIColor, title: String)
    {
        self.navigationBar.barTintColor = color
        self.navigationBar.backgroundColor = color
        self.navigationBar.topItem?.title = title
        self.navigationBar.tintColor = .white
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        shadow.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .bold), .foregroundColor: UIColor.white, NSAttributedString.Key.shadow : shadow]
    }
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
extension CAGradientLayer {
    func getGradientBackground(colorTop: UIColor, colorBottom: UIColor)->CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        return gradientLayer
    }
}
