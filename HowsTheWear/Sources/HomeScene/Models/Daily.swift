//
//  Daily.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import Foundation

struct Daily {
    let time: String
    let weatherIcon: String
    let temperature: String
}

extension Daily {
    static let lists: [Daily] = [
        Daily(time: "지금", weatherIcon: "sun.max.fill", temperature: "7℃"),
        Daily(time: "2PM", weatherIcon: "sun.max.fill", temperature: "7℃"),
        Daily(time: "3PM", weatherIcon: "sun.max.fill", temperature: "6℃"),
        Daily(time: "4PM", weatherIcon: "cloud.sun.fill", temperature: "5℃"),
        Daily(time: "5PM", weatherIcon: "cloud.sun.fill", temperature: "4℃"),
        Daily(time: "6PM", weatherIcon: "cloud.fill", temperature: "4℃"),
        Daily(time: "7PM", weatherIcon: "sunset.fill", temperature: "3℃"),
        Daily(time: "8PM", weatherIcon: "cloud.moon.fill", temperature: "3℃"),
        Daily(time: "9PM", weatherIcon: "cloud.moon.fill", temperature: "3℃"),
        Daily(time: "10PM", weatherIcon: "cloud.moon.bolt.fill", temperature: "3℃"),
        Daily(time: "11PM", weatherIcon: "cloud.moon.rain.fill", temperature: "4℃"),
        Daily(time: "12AM", weatherIcon: "cloud.bolt.rain.fill", temperature: "4℃"),
        Daily(time: "1AM", weatherIcon: "cloud.heavyrain.fill", temperature: "4℃"),
        Daily(time: "2AM", weatherIcon: "cloud.heavyrain.fill", temperature: "4℃"),
        Daily(time: "3AM", weatherIcon: "cloud.rain.fill", temperature: "3℃"),
        Daily(time: "4AM", weatherIcon: "cloud.fill", temperature: "2℃"),
        Daily(time: "5AM", weatherIcon: "moon.fill", temperature: "1℃"),
        Daily(time: "6AM", weatherIcon: "moon.stars.fill", temperature: "1℃"),
        Daily(time: "7AM", weatherIcon: "sunrise.fill", temperature: "2℃"),
        Daily(time: "8AM", weatherIcon: "sun.max.fill", temperature: "4℃"),
        Daily(time: "9AM", weatherIcon: "sun.max.fill", temperature: "6℃"),
        Daily(time: "10AM", weatherIcon: "sun.max.fill", temperature: "7℃"),
        Daily(time: "11AM", weatherIcon: "sun.max.fill", temperature: "8℃"),
        Daily(time: "12PM", weatherIcon: "sun.max.fill", temperature: "9℃"),
        Daily(time: "1PM", weatherIcon: "sun.max.fill", temperature: "8℃")
    ]
}
