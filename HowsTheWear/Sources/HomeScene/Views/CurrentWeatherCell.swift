//
//  CurrentWeatherCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/26/24.
//

import UIKit

import SnapKit
import Then

final class CurrentWeatherCell: UITableViewCell {

    let weatherIcon = UIImageView().then {
        $0.image = UIImage(named: "clear-cloudy")
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor(red: 0.164, green: 0.315, blue: 0.475, alpha: 0.1).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 16
        $0.layer.shadowOffset = CGSize(width: -8, height: 8)
    }
    
    let locationLabel = UILabel().then {
        $0.text = "Busan, Korea"
        $0.textAlignment = .center
        $0.font = .pretendard(size: 24, weight: .semibold)
        $0.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
    }
    
    let temperatureLabel = UILabel().then {
        $0.text = "7"
        $0.textAlignment = .center
        $0.font = .pretendard(size: 70, weight: .medium)
        $0.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
    }
    
    private let temperatureIcon = UIImageView().then {
        $0.image = UIImage(named: "temp")
    }
    
//    let descriptionLabel = UILabel().then {
//        $0.text = "살짝 쌀쌀해요!"
//        $0.textAlignment = .center
//        $0.font = .pretendard(size: 14, weight: .medium)
//        $0.textColor = UIColor(red: 0.439, green: 0.439, blue: 0.439, alpha: 1)
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UI Configuration

private extension CurrentWeatherCell {
    
    func configureUI() {
        backgroundView?.backgroundColor = .clear
        addSubviews([weatherIcon, locationLabel, temperatureLabel, temperatureIcon])
        setupConstraints()
    }
    
    func setupConstraints() {
        weatherIcon.snp.makeConstraints {
            $0.centerX.top.equalToSuperview()
            $0.height.equalTo(170)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(weatherIcon.snp.bottom).inset(30)
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
