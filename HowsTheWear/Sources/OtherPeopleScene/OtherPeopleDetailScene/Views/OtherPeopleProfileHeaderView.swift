//
//  OtherPeopleProfileHeaderView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/8/24.
//

import UIKit

final class OtherPeopleProfileHeaderView: UIView {

    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "ProfileTestImage")
    }
    
    private let profileID = UILabel().then {
        $0.textColor = #colorLiteral(red: 0.3278294206, green: 0.3278294206, blue: 0.3278294206, alpha: 1)
        $0.font = UIFont.pretendard(size: 15, weight: .medium)
        $0.text = "yvmuini"
    }
    
    private let postingDate = UILabel().then {
        $0.textColor = #colorLiteral(red: 0.7411764264, green: 0.7411764264, blue: 0.7411764264, alpha: 1)
        $0.font = UIFont.pretendard(size: 12, weight: .medium)
        $0.text = "2023년 12월 31일"
    }
    
    private let headerLabelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillEqually
        $0.spacing = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
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

extension OtherPeopleProfileHeaderView {
    private func confiugreSubview() {
        [profileID, postingDate].forEach {
            headerLabelStackView.addArrangedSubview($0)
        }
        
        [profileImageView, headerLabelStackView].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.height.equalTo(profileImageView.snp.width)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        headerLabelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(profileImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
        }
    }
    
}
