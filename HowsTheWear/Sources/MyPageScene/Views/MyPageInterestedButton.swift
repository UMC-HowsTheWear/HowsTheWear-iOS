//
//  MyPageInterestedButton.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/21/24.
//

import UIKit

final class MyPageInterestedButton: UIButton {
    
    init(buttonTitle: String) {
        super.init(frame: .zero)
        configureInitialSetting(buttonTitle: buttonTitle)
//        configureLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configure MyPageInterstedButton
extension MyPageInterestedButton {
    
    private func configureInitialSetting(buttonTitle: String) {
        var container = AttributeContainer()
        container.font = UIFont.pretendard(size: 13, weight: .medium)
        var config = UIButton.Configuration.tinted()
        config.attributedTitle = AttributedString(buttonTitle, attributes: container)
        config.baseBackgroundColor = UIColor.white
        config.baseForegroundColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        config.buttonSize = .small
        config.cornerStyle = .capsule
        configuration = config
        
        layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        layer.borderWidth = 1
    }
    
}
