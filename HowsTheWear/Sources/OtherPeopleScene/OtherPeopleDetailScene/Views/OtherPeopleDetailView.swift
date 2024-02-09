//
//  OtherPeopleDetailView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/8/24.
//

import UIKit

final class OtherPeopleDetailView: UIView {

    private let profileHeaderView = OtherPeopleProfileHeaderView()
    
    private let postImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "DetailTestImage")
        $0.clipsToBounds = true
    }
    
    private let postShadowImageview = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "OtherDetailShadow")
    }
    
    private let bottomDescriptionStackView = OtherPeopleDescriptionStackView()
    
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

extension OtherPeopleDetailView {
    private func confiugreSubview() {
        postImageView.addSubview(postShadowImageview)
        
        [profileHeaderView, postImageView, bottomDescriptionStackView].forEach {
            addSubview($0)
        }
        
    }
    
    private func configureLayout() {
        profileHeaderView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.05)
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
        }
        
        postImageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.516)
            make.centerX.equalToSuperview()
            make.top.equalTo(profileHeaderView.snp.bottom).offset(10)
            make.leading.equalTo(profileHeaderView)
        }
        
        postShadowImageview.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        bottomDescriptionStackView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.2)
            make.top.equalTo(postImageView.snp.bottom).offset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(21)
            make.leading.equalTo(postImageView)
            make.trailing.equalTo(postImageView)
        }
    }
    
}
