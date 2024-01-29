//
//  TodayWeatherCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/26/24.
//

import UIKit

import SnapKit
import Then

final class TodayWeatherCell: UITableViewCell {

    static let identifier = "TodayWeatherCell"
    
    private let minimumLabel = UILabel().then {
        $0.text = "최저"
        $0.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        $0.font = .pretendard(size: 12, weight: .semibold)
        $0.textAlignment = .center
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    let minimumTemperature = UILabel().then {
        $0.text = "7℃"
        $0.textColor = UIColor(red: 0.313, green: 0.313, blue: 0.313, alpha: 1)
        $0.font = .pretendard(size: 15, weight: .semibold)
        $0.textAlignment = .center
    }
    
    private let maximumLabel = UILabel().then {
        $0.text = "최고"
        $0.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        $0.font = .pretendard(size: 12, weight: .semibold)
        $0.textAlignment = .center
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    let maximumTemperature = UILabel().then {
        $0.text = "15℃"
        $0.textColor = UIColor(red: 0.313, green: 0.313, blue: 0.313, alpha: 1)
        $0.font = .pretendard(size: 15, weight: .semibold)
        $0.textAlignment = .center
    }
    
    private let precipitationLabel = UILabel().then {
        $0.text = "강수 확률"
        $0.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        $0.font = .pretendard(size: 12, weight: .semibold)
        $0.textAlignment = .center
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    let precipitationProbabilityLabel = UILabel().then {
        $0.text = "60%"
        $0.textColor = UIColor(red: 0.313, green: 0.313, blue: 0.313, alpha: 1)
        $0.font = .pretendard(size: 15, weight: .semibold)
        $0.textAlignment = .center
    }
    
    private lazy var minimumStackView = UIStackView(arrangedSubviews: [minimumLabel, minimumTemperature]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5
    }
    
    private lazy var maximumStackView = UIStackView(arrangedSubviews: [maximumLabel, maximumTemperature]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5
    }
    
    private lazy var temperatureStackView = UIStackView(arrangedSubviews: [minimumStackView, maximumStackView]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 10
    }
    
    private let separatorView = UILabel().then {
        $0.text = "|"
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)
        $0.font = .pretendard(size: 15, weight: .semibold)
    }
    
    private lazy var precipitationStackView = UIStackView(
        arrangedSubviews: [precipitationLabel, precipitationProbabilityLabel]
    ).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5
    }
    
    private lazy var stackView = UIStackView(
        arrangedSubviews: [temperatureStackView, separatorView, precipitationStackView]
    ).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .equalSpacing
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension TodayWeatherCell {
    
    func configureUI() {
        setupContentView()
        setupStackView()
    }
    
    func setupContentView() {
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
        contentView.layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowRadius = 20
        layer.shadowOpacity = 0.15
        layer.masksToBounds = false
    }
    
    func setupStackView() {
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30))
        }
    }
    
}
