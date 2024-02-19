//
//  DailyCollectionCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import UIKit
import WeatherKit

import SnapKit
import Then

final class DailyCollectionCell: UICollectionViewCell {
    
    let weatherIconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let dayOfWeekLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
        $0.font = .pretendard(size: 14, weight: .semibold)
    }
    
    private lazy var iconAndDayView = UIStackView(arrangedSubviews: [weatherIconImageView, dayOfWeekLabel]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 10
    }
    
    let minTemperatureLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.578, green: 0.728, blue: 0.897, alpha: 1)
        $0.font = .pretendard(size: 16, weight: .semibold)
    }
    
    private let separatorView = UILabel().then {
        $0.text = "/"
        $0.textColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
        $0.font = .pretendard(size: 16, weight: .bold)
    }
    
    let maxTemperatureLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.444, green: 0.607, blue: 0.901, alpha: 1)
        $0.font = .pretendard(size: 16, weight: .semibold)
    }
    
    private lazy var temperatureView = UIStackView(arrangedSubviews: [
        minTemperatureLabel, separatorView, maxTemperatureLabel
    ]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 10
    }
    
    private let emptyView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private lazy var dailyView = UIStackView(arrangedSubviews: [iconAndDayView, emptyView,  temperatureView]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 10
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
        weatherIconImageView.image = nil
        dayOfWeekLabel.text = nil
        minTemperatureLabel.text = nil
        maxTemperatureLabel.text = nil
    }
    
    func prepare(dayWeather: DayWeather, timeZone: String) {
        weatherIconImageView.image = UIImage(systemName: dayWeather.symbolName + ".fill")?
            .withRenderingMode(.alwaysOriginal)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
        dateFormatter.timeZone = TimeZone(identifier: timeZone) ?? TimeZone.current
        dateFormatter.dateFormat = "EE"
        
        let calendar = Calendar.current
        let today = Date()
        guard let tenDaysLater = calendar.date(byAdding: .day, value: 10, to: today) else {
            dayOfWeekLabel.text = ""
            return
        }
        
        if calendar.isDateInToday(dayWeather.date) {
            dayOfWeekLabel.text = "오늘"
        } else if dayWeather.date >= today && dayWeather.date <= tenDaysLater {
            dayOfWeekLabel.text = dateFormatter.string(from: dayWeather.date)
        } else {
            dayOfWeekLabel.text = ""
        }
        
        // 온도 변환 및 포매팅
        let convertedHighTemperature = UnitConverter.convertTemperature(temperature: dayWeather.highTemperature)
        let convertedLowTemperature = UnitConverter.convertTemperature(temperature: dayWeather.lowTemperature)
        minTemperatureLabel.attributedText = String.temperatureFormattedString(
            value: convertedLowTemperature.value,
            unit: convertedLowTemperature.unit,
            bFontSize: 16,
            sFontSize: 16,
            weight: .semibold
        )
        maxTemperatureLabel.attributedText = String.temperatureFormattedString(
            value: convertedHighTemperature.value,
            unit: convertedHighTemperature.unit,
            bFontSize: 16,
            sFontSize: 16,
            weight: .semibold
        )
    }
    
}

// MARK: - UI Configuration

private extension DailyCollectionCell {
    
    func configureUI() {
        contentView.backgroundColor = .clear
        contentView.addSubview(dailyView)
        
        weatherIconImageView.layer.masksToBounds = false
        weatherIconImageView.layer.shadowColor = UIColor.black.cgColor
        weatherIconImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        weatherIconImageView.layer.shadowRadius = 20
        weatherIconImageView.layer.shadowOpacity = 0.2
        
        dailyView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.left.equalToSuperview()
        }
    }
    
}
