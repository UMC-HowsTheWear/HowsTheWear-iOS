//
//  HourlyCollectionCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import UIKit
import WeatherKit

import SnapKit
import Then

final class HourlyCollectionCell: UICollectionViewCell {
    
    let timeLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        $0.font = .pretendard(size: 14, weight: .medium)
        $0.textAlignment = .center
        $0.adjustsFontSizeToFitWidth = true
    }
    
    let weatherIconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    let temperatureLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.439, green: 0.439, blue: 0.439, alpha: 1)
        $0.font = .pretendard(size: 14, weight: .semibold)
        $0.textAlignment = .center
    }
    
    private lazy var stackView = UIStackView(arrangedSubviews: [
        timeLabel, weatherIconImageView, temperatureLabel
    ]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timeLabel.text = nil
        weatherIconImageView.image = nil
        temperatureLabel.text = nil
    }
    
    func prepare(hourWeather: HourWeather, timeZone: String) {
        let convertedTemperature = UnitConverter.convertTemperature(temperature: hourWeather.temperature)
        temperatureLabel.text = String(format: "%.0f", convertedTemperature.value) + "℃"

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: timeZone) ?? .current
        dateFormatter.dateFormat = "H" // 24시간 형식으로 변경
        let hour = Int(dateFormatter.string(from: hourWeather.date)) ?? 0

        // 낮과 밤을 결정하는 로직
        let isDaytime = hour >= 6 && hour <= 18

        if let icon = WeatherIcon.icon(for: hourWeather.condition, isDaytime: isDaytime, isLargeSize: false) {
            weatherIconImageView.image = icon
        }

        timeLabel.text = "\(hour)시"
    }
    
}

// MARK: - UI Configuration

private extension HourlyCollectionCell {
    
    func configureUI() {
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
