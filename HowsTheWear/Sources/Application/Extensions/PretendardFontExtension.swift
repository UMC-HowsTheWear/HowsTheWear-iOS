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
        default:
            weightString = "Regular"
        }

        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
    
}
