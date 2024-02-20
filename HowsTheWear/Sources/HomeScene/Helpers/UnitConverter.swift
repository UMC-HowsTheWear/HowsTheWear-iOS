//
//  UnitConverter.swift
//  HowsTheWear
//
//  Created by RAFA on 2/19/24.
//

import Foundation

final class UnitConverter {
    
    private static func getLocalTemperatureUnit() -> UnitTemperature {
        let allUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]

        let baseUnit = allUnits[0]
        let formatter = MeasurementFormatter()
        formatter.locale = .current
        let measurement = Measurement(value: 0, unit: baseUnit)
        let string = formatter.string(from: measurement)
        
        for unit in allUnits where string.contains(unit.symbol) {
            return unit
        }
        
        return baseUnit
    }
    
    private static func needToConvert(temperatureUnit: UnitTemperature) -> Bool {
        let localeTempUnit = getLocalTemperatureUnit()
        return localeTempUnit.symbol != temperatureUnit.symbol
    }
    
    static func convertTemperature(temperature: Measurement<UnitTemperature>) -> Measurement<UnitTemperature> {
        var newTemperature = temperature
        if needToConvert(temperatureUnit: temperature.unit) {
            let newTempUnit = getLocalTemperatureUnit()
            newTemperature = temperature.converted(to: newTempUnit)
        }
        
        return newTemperature
    }
    
}
