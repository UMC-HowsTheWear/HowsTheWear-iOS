//
//  WeeklyCollectionCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import UIKit

import SnapKit
import Then

final class WeeklyCollectionCell: UICollectionViewCell {
    
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
    
    private lazy var weeklyView = UIStackView(arrangedSubviews: [iconAndDayView, emptyView,  temperatureView]).then {
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
        prepare(data: nil)
    }
    
    func prepare(data: Weekly?) {
        weatherIconImageView.image = UIImage(systemName: data?.weatherIcon ?? "sun.max.fill")?
            .withRenderingMode(.alwaysOriginal)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
        weatherIconImageView.layer.masksToBounds = false
        weatherIconImageView.layer.shadowColor = UIColor.black.cgColor
        weatherIconImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        weatherIconImageView.layer.shadowRadius = 20
        weatherIconImageView.layer.shadowOpacity = 0.2
        dayOfWeekLabel.text = data?.day
        minTemperatureLabel.text = data?.minTemperature
        maxTemperatureLabel.text = data?.maxTemperature
    }
    
}

// MARK: - UI Configuration

private extension WeeklyCollectionCell {
    
    func configureUI() {
        contentView.backgroundColor = .clear
        contentView.addSubview(weeklyView)
        
        weeklyView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.left.equalToSuperview()
        }
    }
    
}
