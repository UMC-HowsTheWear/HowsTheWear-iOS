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
    
}
