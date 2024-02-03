//
//  BrowseDetailView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/2/24.
//

import UIKit

final class BrowseDetailView: UIView {
    var recommendedTemperature = 18

    private lazy var backgroundImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "BrowseDetailBackground")
        $0.clipsToBounds = true
    }
    
    let browseDetailCellPagingImageView = BrowseDetailCellPagingImageView()
    
    private lazy var recommendedTemperatureLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .pretendard(size: 14, weight: .regular)
        $0.textAlignment = .left
        $0.text = "추천날씨   \(recommendedTemperature)°C"
    }
    
    private let descriptionImageView = UIImageView().then {
        $0.image = UIImage(named: "DetailItem")
        $0.contentMode = .scaleAspectFill
    }
    
    private let descriptionLikeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .pretendard(size: 14, weight: .regular)
        $0.text = "사진 속 아이템이 마음에 든다면?"
        $0.textAlignment = .left
    }
    
    private let descriptionMoveWebSiteButton = UIButton().then {
        var container = AttributeContainer()
        container.font = UIFont.pretendard(size: 15, weight: .semibold)
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("사이트로 이동", attributes: container)
        config.baseForegroundColor = UIColor.white
        config.image = UIImage(systemName: "chevron.forward")
        config.imagePlacement = .trailing
        config.imagePadding = 6
        config.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        $0.configuration = config
    }
    
    private lazy var descriptionLabelButtonStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 5
        $0.distribution = .fill
    }
    
    private lazy var descriptionBottomStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 12
        $0.distribution = .fill
        
        $0.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        $0.layer.borderWidth = 1
        
        $0.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 15)
        $0.isLayoutMarginsRelativeArrangement = true
        
    }
    
    private lazy var descriptionStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 0
        $0.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        $0.layer.borderWidth = 1
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
        configureLayout()
        browseDetailCellPagingImageView.configureContents([UIImage(named: "DetailTestImage"), UIImage(named: "DetailTestImage"), UIImage(named: "DetailTestImage")])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: GestureRecognizer Delegate Implement
extension BrowseDetailView: UIGestureRecognizerDelegate {
    func configureTapPostImageAction(_ target: Any, _ action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.delegate = self
        browseDetailCellPagingImageView.isUserInteractionEnabled = true
        browseDetailCellPagingImageView.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Configure UI

extension BrowseDetailView {
    private func configureSubview() {
        addSubview(backgroundImageView)
                
        [descriptionLikeLabel, descriptionMoveWebSiteButton].forEach {
            descriptionLabelButtonStackView.addArrangedSubview($0)
        }
        
        [descriptionImageView, descriptionLabelButtonStackView].forEach {
            descriptionBottomStackView.addArrangedSubview($0)
        }
        
        [recommendedTemperatureLabel, descriptionBottomStackView].forEach {
            descriptionStackView.addArrangedSubview($0)
        }
        
        [browseDetailCellPagingImageView, descriptionStackView].forEach {
            backgroundImageView.addSubview($0)
        }
    }
    
    private func configureLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(120)
            make.bottom.equalToSuperview().inset(50)
        }
        
        browseDetailCellPagingImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.leading.equalToSuperview().inset(14)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.725)
        }
        
        descriptionStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.bottom.equalToSuperview().inset(16)
        }
        
        recommendedTemperatureLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
        }
        
        descriptionBottomStackView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.68)
            make.trailing.equalToSuperview()
        }
    }
    
}
