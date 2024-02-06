//
//  Weekly.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import Foundation

struct Weekly {
    let weatherIcon: String
    let day: String
    let minTemperature: String
    let maxTemperature: String
}

extension Weekly {
    static let lists: [Weekly] = [
        Weekly(weatherIcon: "sun.max.fill", day: "오늘", minTemperature: "7℃", maxTemperature: "15℃"),
        Weekly(weatherIcon: "sun.max.fill", day: "화", minTemperature: "5℃", maxTemperature: "13℃"),
        Weekly(weatherIcon: "cloud.sun.fill", day: "수", minTemperature: "5℃", maxTemperature: "12℃"),
        Weekly(weatherIcon: "sun.max.fill", day: "목", minTemperature: "4℃", maxTemperature: "10℃"),
        Weekly(weatherIcon: "cloud.sun.rain.fill", day: "금", minTemperature: "3℃", maxTemperature: "8℃"),
        Weekly(weatherIcon: "cloud.sun.rain.fill", day: "토", minTemperature: "3℃", maxTemperature: "8℃"),
        Weekly(weatherIcon: "cloud.rain.fill", day: "일", minTemperature: "2℃", maxTemperature: "8℃"),
        Weekly(weatherIcon: "cloud.fill", day: "월", minTemperature: "2℃", maxTemperature: "7℃"),
        Weekly(weatherIcon: "sun.max.fill", day: "화", minTemperature: "2℃", maxTemperature: "7℃"),
        Weekly(weatherIcon: "sun.max.fill", day: "수", minTemperature: "3℃", maxTemperature: "9℃"),
    ]
}
