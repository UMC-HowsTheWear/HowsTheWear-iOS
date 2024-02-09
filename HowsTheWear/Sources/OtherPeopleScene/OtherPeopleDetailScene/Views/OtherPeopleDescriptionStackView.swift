//
//  OtherPeopleBottomDescriptionStackView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/8/24.
//

import UIKit

final class OtherPeopleDescriptionStackView: UIView {
    
    private var saveStyleNumber: Int = 0
    
    private var recommendedTemperature: Int = 0

    private var feelTemperature: String = "너무 더워요"
    
    private lazy var feelTemperatureText = feelTemperatureLabel.text ?? ""

    private let saveStyleImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "bookmark-save")
    }
    
    private lazy var saveNumberLabel = UILabel().then {
        $0.textColor = #colorLiteral(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 1)
        $0.font = UIFont.pretendard(size: 14, weight: .medium)
        $0.textAlignment = .left
        $0.text = "\(saveStyleNumber)명이 이 코디를 저장했어요"
    }
    
    private lazy var recommendedTemperatureLabel = UILabel().then {
        $0.textColor = #colorLiteral(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 1)
        $0.font = UIFont.pretendard(size: 13, weight: .medium)
        $0.textAlignment = .left
        $0.text = "     추천날씨 \(recommendedTemperature)°C"
        $0.layer.borderColor = #colorLiteral(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 1)
        $0.layer.borderWidth = 1
        
        let attributerdString = NSMutableAttributedString(string: $0.text ?? "")
        let range = ($0.text! as NSString).range(of: "추천날씨")
        attributerdString.addAttribute(.font, value: UIFont.pretendard(size: 13, weight: .medium), range: range)
        attributerdString.addAttribute(
            .foregroundColor,
            value: #colorLiteral(red: 0.7411764264, green: 0.7411764264, blue: 0.7411764264,alpha: 1),
                range: range
        )
        $0.attributedText = attributerdString
    }
    
    private lazy var feelTemperatureLabel = UILabel().then {
        $0.textColor = #colorLiteral(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 1)
        $0.font = UIFont.pretendard(size: 13, weight: .medium)
        $0.text = "     체감 \(feelTemperature)"
        
        let attributerdString = NSMutableAttributedString(string: $0.text ?? "")
        let range = ($0.text! as NSString).range(of: "체감")
        attributerdString.addAttribute(.font, value: UIFont.pretendard(size: 13, weight: .medium), range: range)
        attributerdString.addAttribute(
            .foregroundColor,
            value: #colorLiteral(red: 0.7411764264, green: 0.7411764264, blue: 0.7411764264,alpha: 1),
                range: range
        )
        $0.attributedText = attributerdString
    }
    
    private lazy var saveStyleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 0
        $0.alignment = .center
        $0.distribution = .fillProportionally
    }
    
    private lazy var descriptionBottomStackview = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 0
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.layer.borderColor = #colorLiteral(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 1)
        $0.layer.borderWidth = 1
    }
    
    private lazy var descriptionStackview = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 0
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.layer.borderColor = #colorLiteral(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 1)
        $0.layer.borderWidth = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        confiugreSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure UI

extension OtherPeopleDescriptionStackView {
    private func confiugreSubview() {
        
        [saveStyleImage, saveNumberLabel].forEach {
            saveStyleStackView.addArrangedSubview($0)
        }
        
        [recommendedTemperatureLabel, feelTemperatureLabel].forEach {
            descriptionBottomStackview.addArrangedSubview($0)
        }
        
        [saveStyleStackView, descriptionBottomStackview].forEach {
            descriptionStackview.addArrangedSubview($0)
        }
        
        [descriptionStackview].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        descriptionStackview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        saveStyleImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(5)
        }
        
    }
    
}
