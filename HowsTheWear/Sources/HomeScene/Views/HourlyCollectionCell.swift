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
        $0.contentMode = .scaleAspectFit
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
        weatherIconImageView.image = UIImage(systemName: hourWeather.symbolName + ".fill")?
            .withRenderingMode(.alwaysOriginal)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: timeZone) ?? .current
        dateFormatter.dateFormat = "h"
        
        var hourString = dateFormatter.string(from: hourWeather.date)
        if hourString.hasPrefix("0") {
            hourString.remove(at: hourString.startIndex)
        }
        
        timeLabel.text = hourString + "시"
        
        // 12시간제로 변경되면 아래 코드 적용
//        let hourInt = Int(hourString) ?? 0
//        timeLabel.text = hourString + (hourInt < 12 ? "AM " : "PM ")
    }
    
}

// MARK: - UI Configuration

private extension HourlyCollectionCell {
    
    func configureUI() {
        contentView.addSubview(stackView)
        
        weatherIconImageView.layer.masksToBounds = false
        weatherIconImageView.layer.shadowColor = UIColor.black.cgColor
        weatherIconImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        weatherIconImageView.layer.shadowRadius = 20
        weatherIconImageView.layer.shadowOpacity = 0.2
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
