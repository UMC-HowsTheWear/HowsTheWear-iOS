//
//  TemperatureSliderView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/17/24.
//

import UIKit

final class TemperatureSliderView: UIView {
    
    private let temperatureTitleLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
        $0.font = UIFont.pretendard(size: 16, weight: .semibold)
    }
    
    let temperatureSlider = MyPageTemperatureSlider()
    
    private let insensitiveLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        $0.font = UIFont.pretendard(size: 13, weight: .medium)
        $0.text = "둔감해요"
    }
    
    private let sensitiveLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        $0.font = UIFont.pretendard(size: 13, weight: .medium)
        $0.text = "민감해요"
    }

    init(temperatureTitleText: String) {
        super.init(frame: .zero)
        temperatureTitleLabel.text = temperatureTitleText
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure UI

extension TemperatureSliderView {
    private func configureSubview() {
        [temperatureTitleLabel, temperatureSlider, insensitiveLabel, sensitiveLabel].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        temperatureTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        temperatureSlider.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(temperatureTitleLabel.snp.trailing).offset(30.5)
        }
        
        insensitiveLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureSlider.snp.bottom).offset(4)
            make.leading.equalTo(temperatureSlider)
            make.bottom.equalToSuperview()
        }
        
        sensitiveLabel.snp.makeConstraints { make in
            make.top.equalTo(insensitiveLabel)
            make.trailing.equalTo(temperatureSlider)
            make.bottom.equalToSuperview()
        }
    }
    
}
