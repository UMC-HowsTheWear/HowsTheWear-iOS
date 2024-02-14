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
        $0.isUserInteractionEnabled = true
    }
    
    private let postShadowImageview = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "OtherDetailShadow")
    }
    
    let bookmarkButton = UIButton().then {
        $0.setImage(UIImage(named: "tag"), for: .normal)
    }
    
    private let bottomDescriptionStackView = OtherPeopleDescriptionStackView()
    
    let myPostButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setImage(UIImage(systemName: "plus")?
            .withConfiguration(
                UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)), for: .normal)
        $0.tintColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureInitialSetting()
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

// MARK: - Configure InitialSetting

extension OtherPeopleDetailView {
    private func configureInitialSetting() {
        myPostButton.layer.cornerRadius = myPostButton.frame.height / 2
        myPostButton.layer.shadowColor = UIColor.black.cgColor
        myPostButton.layer.shadowOpacity = 0.5
        myPostButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        myPostButton.layer.shadowRadius = 10
    }
    
}

// MARK: - Configure UI

extension OtherPeopleDetailView {
    private func confiugreSubview() {
        [postShadowImageview, bookmarkButton].forEach {
            postImageView.addSubview($0)
        }
        
        [profileHeaderView, postImageView, bottomDescriptionStackView, myPostButton].forEach {
            addSubview($0)
        }
        
    }
    
    private func configureLayout() {
        profileHeaderView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.05)
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
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
        
        bookmarkButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        bottomDescriptionStackView.snp.makeConstraints { make in
            make.height.equalTo(postImageView).multipliedBy(0.2)
            make.top.equalTo(postImageView.snp.bottom).offset(16)
            make.leading.equalTo(postImageView)
            make.trailing.equalTo(postImageView)
        }
        
        myPostButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(15)
            $0.width.height.equalTo(55)
        }
    }
    
}
