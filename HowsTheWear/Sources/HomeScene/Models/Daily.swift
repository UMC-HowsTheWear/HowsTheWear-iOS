//
//  Daily.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import Foundation

struct Daily {
    let weatherIcon: String
    let day: String
    let minTemperature: String
    let maxTemperature: String
}

extension Daily {
    static let lists: [Daily] = [
        Daily(weatherIcon: "sun.max.fill", day: "오늘", minTemperature: "7℃", maxTemperature: "15℃"),
        Daily(weatherIcon: "sun.max.fill", day: "화", minTemperature: "5℃", maxTemperature: "13℃"),
        Daily(weatherIcon: "cloud.sun.fill", day: "수", minTemperature: "5℃", maxTemperature: "12℃"),
        Daily(weatherIcon: "sun.max.fill", day: "목", minTemperature: "4℃", maxTemperature: "10℃"),
        Daily(weatherIcon: "cloud.sun.rain.fill", day: "금", minTemperature: "3℃", maxTemperature: "8℃"),
        Daily(weatherIcon: "cloud.sun.rain.fill", day: "토", minTemperature: "3℃", maxTemperature: "8℃"),
        Daily(weatherIcon: "cloud.rain.fill", day: "일", minTemperature: "2℃", maxTemperature: "8℃"),
        Daily(weatherIcon: "cloud.fill", day: "월", minTemperature: "2℃", maxTemperature: "7℃"),
        Daily(weatherIcon: "sun.max.fill", day: "화", minTemperature: "2℃", maxTemperature: "7℃"),
        Daily(weatherIcon: "sun.max.fill", day: "수", minTemperature: "3℃", maxTemperature: "9℃"),
    ]
}
