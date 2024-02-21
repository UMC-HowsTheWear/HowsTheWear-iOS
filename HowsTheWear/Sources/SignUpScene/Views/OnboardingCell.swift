//
//  OnboardingCell.swift
//  HowsTheWear
//
//  Created by RAFA on 2/21/24.
//

import UIKit

import SnapKit
import Then

final class OnboardingCell: UICollectionViewCell {
    
    private let descriptionLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.font = .pretendard(size: 22, weight: .semibold)
    }
    
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ data: Onboarding) {
        descriptionLabel.text = data.description
        iconImageView.image = UIImage(named: data.image)
        applyFloatingAnimation(to: iconImageView)
    }
    
    private func configureUI() {
        contentView.addSubviews([descriptionLabel, iconImageView])
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(88)
            $0.left.equalTo(20)
        }
        
        iconImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func applyFloatingAnimation(to view: UIView) {
        guard view.layer.animation(forKey: "floating") == nil else { return }

        let animation = CABasicAnimation(keyPath: "transform.translation.y")
        animation.toValue = 20
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity

        view.layer.add(animation, forKey: "floating")
    }
    
}
