//
//  CurrentWeatherCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/26/24.
//

import CoreLocation
import UIKit
import WeatherKit

import SnapKit
import Then

final class CurrentWeatherCell: UITableViewCell {
    
    let locationManager = CLLocationManager()
    let weatherService = WeatherService()

    let weatherIcon = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let locationLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .pretendard(size: 24, weight: .semibold)
        $0.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
    }
    
    let temperatureLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .pretendard(size: 70, weight: .medium)
        $0.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
    }
    
    private let temperatureIcon = UIImageView().then {
        $0.image = UIImage(named: "temp")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLocationManager()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - CLLocationManagerDelegate

extension CurrentWeatherCell: CLLocationManagerDelegate {
    
    func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getWeather(location: CLLocation) {
        Task {
            do {
                let result = try await weatherService.weather(for: location)
                DispatchQueue.main.async {
                    // 온도 업데이트
                    let temperature = result.currentWeather.temperature.converted(to: .celsius).value
                    self.temperatureLabel.text = String(format: "%.0f", temperature)

                    // 날씨 아이콘 업데이트
                    self.updateWeatherIcon(for: result.currentWeather.condition)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                if let placemark = placemarks?.first, let city = placemark.locality, let country = placemark.country {
                    DispatchQueue.main.async {
                        self.locationLabel.text = "\(city), \(country)"
                    }
                }
            }

            locationManager.stopUpdatingLocation()
            getWeather(location: location)
        }
    }
    
}

// MARK: - UI Update

extension CurrentWeatherCell {
    
    func updateWeatherIcon(for condition: WeatherCondition) {
        // 낮인지 밤인지 결정하는 로직 추가
        let isDaytime = checkIfDaytime()
        if let icon = WeatherIcon.icon(for: condition, isDaytime: isDaytime) {
            weatherIcon.image = icon
        }
    }

    // 낮인지 밤인지를 판단하는 메서드
    func checkIfDaytime() -> Bool {
        let currentHour = Calendar.current.component(.hour, from: Date())
        // 예를 들어, 6시부터 18시 사이를 낮으로 간주
        return currentHour >= 6 && currentHour <= 18
    }
    
    func updateWeather(currentWeather: CurrentWeather, location: CLLocation) {
        // 날씨 아이콘 업데이트
        updateWeatherIcon(for: currentWeather.condition)
        
        // 온도 레이블 업데이트
        let temperature = currentWeather.temperature.converted(to: .celsius).value
        temperatureLabel.text = String(format: "%.0f", temperature)

        // 위치 레이블 업데이트
        CLGeocoder().reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard error == nil,
                  let placemark = placemarks?.first,
                  let city = placemark.locality,
                  let country = placemark.country
            else {
                return
            }
            DispatchQueue.main.async {
                self?.locationLabel.text = "\(city), \(country)"
            }
        }
    }
    
}

// MARK: - UI Configuration

private extension CurrentWeatherCell {
    
    func configureUI() {
        backgroundView?.backgroundColor = .clear
        addSubviews([weatherIcon, locationLabel, temperatureLabel, temperatureIcon])
        setupConstraints()
        configureWeatherIconShadow()
    }
    
    func configureWeatherIconShadow() {
        weatherIcon.layer.masksToBounds = false
        weatherIcon.layer.shadowColor = UIColor(red: 0.164, green: 0.315, blue: 0.475, alpha: 0.1).cgColor
        weatherIcon.layer.shadowOpacity = 1
        weatherIcon.layer.shadowRadius = 16
        weatherIcon.layer.shadowOffset = CGSize(width: -8, height: 8)
    }
    
    func setupConstraints() {
        weatherIcon.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(90)
            $0.width.height.equalTo(170)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(weatherIcon.snp.bottom).offset(20)
            $0.left.equalTo(20)
            $0.height.equalTo(24)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(locationLabel.snp.bottom).offset(10)
            $0.height.equalTo(70)
            $0.bottom.equalTo(-40)
        }
        
        temperatureIcon.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.top).inset(5)
            $0.left.equalTo(temperatureLabel.snp.right).offset(5)
            $0.height.equalTo(10)
        }
    }
    
}
