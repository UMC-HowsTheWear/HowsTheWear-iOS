//
//  StyleHashTagCollectionViewCell.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/21/24.
//

import UIKit

final class StyleHashTagCollectionViewCell: UICollectionViewCell {
    
    let styleHashTagButton = UIButton().then {
        var container = AttributeContainer()
        container.font = UIFont.pretendard(size: 13, weight: .medium)
        var config = UIButton.Configuration.tinted()
        config.attributedTitle = AttributedString("미니멀", attributes: container)
        config.baseBackgroundColor = UIColor.white
        config.baseForegroundColor = UIColor.black
        config.buttonSize = .small
        config.cornerStyle = .capsule
        $0.configuration = config
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureIntialSetting()
        configureSubviews()
        configureLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure InitialSetting
extension StyleHashTagCollectionViewCell {
    
    private func configureIntialSetting() {
        layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        layer.borderWidth = 1
        
        styleHashTagButton.addTarget(self, action: #selector(didTapStyleHashTagButton), for: .touchUpInside)
    }
    
    @objc private func didTapStyleHashTagButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if styleHashTagButton.isSelected == true {
            styleHashTagButton.configuration?.baseBackgroundColor = .black
            styleHashTagButton.configuration?.baseForegroundColor = .white
        } else {
            styleHashTagButton.configuration?.baseBackgroundColor = .white
            styleHashTagButton.configuration?.baseForegroundColor = .black
        }
    }
    
}


// MARK: - Configure UI
extension StyleHashTagCollectionViewCell {
    
    private func configureSubviews() {
        contentView.addSubview(styleHashTagButton)
    }
    
    private func configureLayout() {
        styleHashTagButton.snp.makeConstraints { make in
            make.margins.equalToSuperview()
        }
    }
    
    private func configureCancelButton() {
        
    }
    
}
