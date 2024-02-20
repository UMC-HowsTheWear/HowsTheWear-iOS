//
//  String+Extension.swift
//  HowsTheWear
//
//  Created by RAFA on 2/19/24.
//

import WeatherKit
import UIKit

extension String {
    
    static public func temperatureFormattedString(value: Double, unit: UnitTemperature, bFontSize: Double, sFontSize: Double, weight: UIFont.Weight) -> NSAttributedString {
        let tempString: NSMutableAttributedString = NSMutableAttributedString()
        let tStr = String(format: "%.0f", value)
        let uStr: String  = unit.symbol
        
        let tAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.pretendard(size: bFontSize, weight: weight)]
        let uAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.pretendard(size: bFontSize, weight: weight)]
        tempString.append(NSAttributedString(string: tStr, attributes: tAttributes))
        tempString.append(NSAttributedString(string: uStr, attributes: uAttributes))
        
        return tempString
    }
    
}
