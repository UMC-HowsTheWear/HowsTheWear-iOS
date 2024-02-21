//
//  DateFormatter.swift
//  HowsTheWear
//
//  Created by RAFA on 2/19/24.
//

import Foundation

extension Date {
    
    func utcToLocal(timeZone: String, with format: String) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone(abbreviation: timeZone)
        dateFormatter.dateFormat = format
    
        return dateFormatter.string(from: self)
    }
    
    func currentDayString(timeZone: String) -> String {
        guard let tZone = TimeZone(identifier: timeZone) else {
            print("Invalid time zone identifier: \(timeZone)")
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        dateFormatter.timeZone = tZone

        return dateFormatter.string(from: self)
    }

    func currentHourString(timeZone: String) -> String {
        guard let tZone = TimeZone(abbreviation: timeZone) else {
            print("Invalid time zone abbreviation: \(timeZone)")
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h"
        dateFormatter.timeZone = tZone

        return dateFormatter.string(from: self)
    }
    
    func formatLocalTime(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
}
