//
//  WeatherIcon.swift
//  HowsTheWear
//
//  Created by RAFA on 2/19/24.
//

import UIKit
import WeatherKit

struct WeatherIcon {
    static let symbols: [WeatherCondition: (day: String, night: String)] = [
        .blizzard: ("clear-cloudy", "clear-cloudy-moon"),
        .blowingDust: ("clear-cloudy", "clear-cloudy-moon"),
        .blowingSnow: ("clear-cloudy", "clear-cloudy-moon"),
        .breezy: ("clear-cloudy", "clear-cloudy-moon"),
        .clear: ("sunny", "moon"),
        .cloudy: ("cloudy", "cloudy"),
        .drizzle: ("drizzle", "drizzle-moon"),
        .flurries: ("snow-flurries", "snow-flurries"),
        .foggy: ("clear-cloudy", "clear-cloudy-moon"),
        .freezingDrizzle: ("clear-cloudy", "clear-cloudy-moon"),
        .freezingRain: ("clear-cloudy", "clear-cloudy-moon"),
        .frigid: ("clear-cloudy", "clear-cloudy-moon"),
        .hail: ("hail", "hail"),
        .haze: ("clear-cloudy", "clear-cloudy-moon"),
        .heavyRain: ("clear-cloudy", "clear-cloudy-moon"),
        .heavySnow: ("clear-cloudy", "clear-cloudy-moon"),
        .hot: ("clear-cloudy", "clear-cloudy-moon"),
        .hurricane: ("clear-cloudy", "clear-cloudy-moon"),
        .isolatedThunderstorms: ("isolated-thunderstroms", "isolated-thunderstroms"),
        .mostlyClear: ("clear-cloudy", "clear-cloudy-moon"),
        .mostlyCloudy: ("clear-cloudy", "clear-cloudy-moon"),
        .partlyCloudy: ("partly-cloudy", "partly-cloudy-moon"),
        .rain: ("showers", "showers"),
        .scatteredThunderstorms: ("clear-cloudy", "clear-cloudy-moon"),
        .sleet: ("sleet", "sleet"),
        .smoky: ("clear-cloudy", "clear-cloudy-moon"),
        .snow: ("snow", "snow"),
        .strongStorms: ("clear-cloudy", "clear-cloudy-moon"),
        .sunFlurries: ("clear-cloudy", "clear-cloudy-moon"),
        .sunShowers: ("clear-cloudy", "clear-cloudy-moon"),
        .thunderstorms: ("thunderstroms", "thunderstroms"),
        .tropicalStorm: ("tornado", "tornado"),
        .windy: ("windy", "windy"),
        .wintryMix: ("clear-cloudy", "clear-cloudy-moon"),
    ]

    static func icon(for condition: WeatherCondition, isDaytime: Bool, isLargeSize: Bool = true) -> UIImage? {
        if let symbolPair = symbols[condition] {
            let baseImageName = isDaytime ? symbolPair.day : symbolPair.night
            let imageName = isLargeSize ? baseImageName : "sub-\(baseImageName)"
            return UIImage(named: imageName)
        }
        return nil
    }
}
