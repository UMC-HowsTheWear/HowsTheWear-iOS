//
//  WeatherDataCenter.swift
//  HowsTheWear
//
//  Created by RAFA on 2/19/24.
//

import CoreLocation
import WeatherKit

final class WeatherDataCenter {
    
    static let shared = WeatherDataCenter()
    
    let weatherService = WeatherService.shared
    var weather: Weather?
    
    private(set) var currentWeather: CurrentWeather?
    private(set) var hourlyWeather: [HourWeather] = []
    private(set) var dailyWeather: [DayWeather] = []
    
    func getTodayWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await weatherService.weather(for: location)

                self.currentWeather = result.currentWeather
                self.dailyWeather = result.dailyForecast.forecast
                self.hourlyWeather = result.hourlyForecast.forecast

                completion()
            } catch {
                print("\n\nError:"+String(describing: error))
            }
        }
    }
    
    func getWeatherForLocation(
        location: CLLocation,
        completion: @escaping (_ result: Result<ParsedWeather, Error>) -> Void
    ) {
        Task {
            do {
                // 시작 시간을 현재 시간으로 설정
                let hourlyStartDate = Date.now
                // 종료 시간을 현재 시간으로부터 24시간 뒤로 설정
                let hourlyEndDate = Calendar.current.date(byAdding: .hour, value: 24, to: hourlyStartDate)!
                
                let weatherData: (
                    currentWeather: CurrentWeather,
                    hourlyForecast: Forecast<HourWeather>,
                    weatherAlerts: [WeatherAlert]?,
                    dailyForecast: Forecast<DayWeather>
                ) = try await weatherService.weather(
                    for: location,
                    including: .current, .hourly(
                        startDate: hourlyStartDate,
                        endDate: hourlyEndDate
                    ), .alerts, .daily
                )
                
                let parsed = ParsedWeather(
                    currentWeather: weatherData.currentWeather,
                    hourlyForecast: weatherData.hourlyForecast,
                    dailyForecast: weatherData.dailyForecast,
                    weatherAlerts: weatherData.weatherAlerts
                )
                
                DispatchQueue.main.async {
                    completion(.success(parsed))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
}
