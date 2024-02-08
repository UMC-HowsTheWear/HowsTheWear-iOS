//
//  UIView+Extension.swift
//  HowsTheWear
//
//  Created by RAFA on 1/26/24.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    func applyShadow() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 10
    }
    
}
