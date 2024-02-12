//
//  Hourly.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import Foundation

struct Hourly {
    let time: String
    let weatherIcon: String
    let temperature: String
}

extension Hourly {
    static let lists: [Hourly] = [
        Hourly(time: "지금", weatherIcon: "sun.max.fill", temperature: "7℃"),
        Hourly(time: "2PM", weatherIcon: "sun.max.fill", temperature: "7℃"),
        Hourly(time: "3PM", weatherIcon: "sun.max.fill", temperature: "6℃"),
        Hourly(time: "4PM", weatherIcon: "cloud.sun.fill", temperature: "5℃"),
        Hourly(time: "5PM", weatherIcon: "cloud.sun.fill", temperature: "4℃"),
        Hourly(time: "6PM", weatherIcon: "cloud.fill", temperature: "4℃"),
        Hourly(time: "7PM", weatherIcon: "sunset.fill", temperature: "3℃"),
        Hourly(time: "8PM", weatherIcon: "cloud.moon.fill", temperature: "3℃"),
        Hourly(time: "9PM", weatherIcon: "cloud.moon.fill", temperature: "3℃"),
        Hourly(time: "10PM", weatherIcon: "cloud.moon.bolt.fill", temperature: "3℃"),
        Hourly(time: "11PM", weatherIcon: "cloud.moon.rain.fill", temperature: "4℃"),
        Hourly(time: "12AM", weatherIcon: "cloud.bolt.rain.fill", temperature: "4℃"),
        Hourly(time: "1AM", weatherIcon: "cloud.heavyrain.fill", temperature: "4℃"),
        Hourly(time: "2AM", weatherIcon: "cloud.heavyrain.fill", temperature: "4℃"),
        Hourly(time: "3AM", weatherIcon: "cloud.rain.fill", temperature: "3℃"),
        Hourly(time: "4AM", weatherIcon: "cloud.fill", temperature: "2℃"),
        Hourly(time: "5AM", weatherIcon: "moon.fill", temperature: "1℃"),
        Hourly(time: "6AM", weatherIcon: "moon.stars.fill", temperature: "1℃"),
        Hourly(time: "7AM", weatherIcon: "sunrise.fill", temperature: "2℃"),
        Hourly(time: "8AM", weatherIcon: "sun.max.fill", temperature: "4℃"),
        Hourly(time: "9AM", weatherIcon: "sun.max.fill", temperature: "6℃"),
        Hourly(time: "10AM", weatherIcon: "sun.max.fill", temperature: "7℃"),
        Hourly(time: "11AM", weatherIcon: "sun.max.fill", temperature: "8℃"),
        Hourly(time: "12PM", weatherIcon: "sun.max.fill", temperature: "9℃"),
        Hourly(time: "1PM", weatherIcon: "sun.max.fill", temperature: "8℃")
    ]
}
