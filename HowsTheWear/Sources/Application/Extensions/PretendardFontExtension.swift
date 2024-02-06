//
//  FontExtension.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/21/24.
//

import UIKit

extension UIFont {
    
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "Pretendard"

        var weightString: String
        switch weight {
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        case .medium:
            weightString = "Medium"
        default:
            weightString = "Regular"
        }
        
        let fontName = "\(familyName)-\(weightString)"
        if let font = UIFont(name: fontName, size: fontSize) {
            return font
        } else {
            print("Failed to load font: \(fontName)")
            return .systemFont(ofSize: fontSize, weight: weight)
        }
    }
}
