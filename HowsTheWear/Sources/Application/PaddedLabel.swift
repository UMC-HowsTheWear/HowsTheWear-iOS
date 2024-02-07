//
//  PaddedLabel.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import UIKit

class PaddedLabel: UILabel {
    
    var topInset: CGFloat = 0.0
    var bottomInset: CGFloat = 0.0
    var leftInset: CGFloat = 0.0
    var rightInset: CGFloat = 0.0
    var maximumWidth: CGFloat = 140.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width = min(size.width + leftInset + rightInset, maximumWidth)
        return CGSize(width: size.width, height: size.height + topInset + bottomInset)
    }
    
}
