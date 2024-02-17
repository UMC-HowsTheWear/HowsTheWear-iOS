//
//  OtherPeopleBottomDescriptionStackView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/8/24.
//

import UIKit

final class OtherPeopleDescriptionStackView: UIView {
    
    private var saveStyleNumber: Int = 0 {
        didSet {
            var container = AttributeContainer()
            container.font = UIFont.pretendard(size: 14, weight: .medium)
            var config = saveStyleButton.configuration ?? UIButton.Configuration.plain()
            config.attributedTitle = AttributedString("\(saveStyleNumber)명이 이 코디를 저장했어요", attributes: container)
            saveStyleButton.configuration = config
        }
    }
    
    private var recommendedTemperature: Int = 0

    private var feelTemperature: String = "너무 더워요"
    
    private lazy var feelTemperatureText = feelTemperatureLabel.text ?? ""
    
    private let saveStyleButtonContainerView = UIView()
    
    private let recommendedTemperatureLabelContainerView = UIView()
    
    private let feelTemperatureLabelContainerView = UIView().then {
        $0.layer.borderColor = #colorLiteral(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 1)
        $0.layer.borderWidth = 1
    }
    
    private lazy var saveStyleButton = UIButton().then {
        $0.setImage(UIImage(named: "bookmark-empty"), for: .normal)
        $0.setImage(UIImage(named: "bookmark-fill"), for: .selected)

        var container = AttributeContainer()
        container.font = UIFont.pretendard(size: 14, weight: .medium)
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("\(saveStyleNumber)명이 이 코디를 저장했어요", attributes: container)
        config.baseForegroundColor = #colorLiteral(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 1)
        config.baseBackgroundColor = .clear
        config.image = UIImage(named: "bookmark-empty")
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        $0.configuration = config
    }
    
    private lazy var recommendedTemperatureLabel = UILabel().then {
        $0.textColor = #colorLiteral(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 1)
        $0.font = UIFont.pretendard(size: 13, weight: .medium)
        $0.textAlignment = .left
        $0.text = "추천날씨 \(recommendedTemperature)°C"
        
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
        $0.text = "체감 \(feelTemperature)"
        
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
        configureAddtarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure Action
extension OtherPeopleDescriptionStackView {
    private func configureAddtarget() {
        saveStyleButton.addTarget(self, action: #selector(saveStyleButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func saveStyleButtonTapped(_ sender: UIButton) {
        if sender.isSelected == false {
            saveStyleNumber += 1
            sender.isSelected.toggle()
        } else {
            if saveStyleNumber > 0 {
                saveStyleNumber -= 1
            }
            sender.isSelected.toggle()
        }
    }
}

// MARK: - Configure UI

extension OtherPeopleDescriptionStackView {
    private func confiugreSubview() {
        
        saveStyleButtonContainerView.addSubview(saveStyleButton)
        recommendedTemperatureLabelContainerView.addSubview(recommendedTemperatureLabel)
        feelTemperatureLabelContainerView.addSubview(feelTemperatureLabel)

        [recommendedTemperatureLabelContainerView, feelTemperatureLabelContainerView].forEach {
            descriptionBottomStackview.addArrangedSubview($0)
        }
        
        [saveStyleButtonContainerView, descriptionBottomStackview].forEach {
            descriptionStackview.addArrangedSubview($0)
        }
        
        addSubview(descriptionStackview)
    }
    
    private func configureLayout() {
        
        recommendedTemperatureLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
        }
        
        feelTemperatureLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
        }
        
        saveStyleButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
        }
        
        descriptionStackview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
