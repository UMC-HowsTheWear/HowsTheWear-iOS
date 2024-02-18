//
//  MyPageView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/15/24.
//

import UIKit

final class MyPageView: UIView {
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    let profileImageView = UIImageView().then  {
        $0.image = UIImage(named: "DefaultProfileImage")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    let postProfileImageButton = UIButton().then {
        $0.setImage(UIImage(named: "PostProfileImage"), for: .normal)
    }
    
    private let profileUserInfoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 4
        $0.distribution = .fillProportionally
    }
    
    private let profileUserNickNameLabel = UILabel().then {
        $0.text = "유저 닉네임"
        $0.font = UIFont.pretendard(size: 16, weight: .semibold)
        $0.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    private let profileUserIDLabel = UILabel().then {
        $0.text = "유저 ID"
        $0.font = UIFont.pretendard(size: 14, weight: .medium)
        $0.textColor = UIColor(red: 0.439, green: 0.439, blue: 0.439, alpha: 1)
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    private let userFashionStyleTitleLabel = UILabel().then {
        $0.text = "나의 패션 스타일"
        $0.font = UIFont.pretendard(size: 16, weight: .semibold)
        $0.textColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1)
    }
    
    private let editUserFashionStyleLabel = UILabel().then {
        $0.text = "수정하기"
        $0.font = UIFont.pretendard(size: 14, weight: .medium)
        $0.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        $0.textAlignment = .right
    }
        
    private let styleHashTagCollectionView = StyleHashTagView("MyPageStyleCollectionViewCell")
    
    private let heatSlider = TemperatureSliderView(temperatureTitleText: "더위")
    
    private let coldSlider = TemperatureSliderView(temperatureTitleText: "추위")
    
    private let myPagePostViewController: UIViewController? = {
        let pageViewController = MyPagePostPagingViewController(
            viewControllers: [MyPostCollectionViewController(), SavedPostCollectionViewController()]
        )
        return pageViewController
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
        configureLayout()
        backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configure UI

extension MyPageView {
    
    private func configureSubview() {
        guard let myPagePostPageView = myPagePostViewController?.view else {
            return
        }
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [profileUserNickNameLabel, profileUserIDLabel].forEach {
            profileUserInfoStackView.addArrangedSubview($0)
        }
        
        [profileImageView,
         postProfileImageButton,
         profileUserInfoStackView,
         userFashionStyleTitleLabel,
         editUserFashionStyleLabel,
         styleHashTagCollectionView,
         heatSlider,
         coldSlider,
         myPagePostPageView
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func configureLayout() {
        guard let myPagePostPageView = myPagePostViewController?.view else {
            return
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.height.equalTo(2000)
            make.top.bottom.leading.trailing.equalTo(scrollView.frameLayoutGuide)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(profileImageView.snp.height)
            make.top.equalToSuperview().inset(15)           // 임시 수정
            make.leading.equalToSuperview().inset(148)
        }
        
        postProfileImageButton.snp.makeConstraints { make in
            make.bottom.equalTo(profileImageView).offset(-3)
            make.trailing.equalTo(profileImageView).offset(8)
        }
        
        profileUserInfoStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(100)
        }
        
        userFashionStyleTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(profileUserInfoStackView.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(20)
        }
        
        editUserFashionStyleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(userFashionStyleTitleLabel)
            make.trailing.equalToSuperview().inset(20)
        }
        
        styleHashTagCollectionView.snp.makeConstraints { make in
            make.top.equalTo(userFashionStyleTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(userFashionStyleTitleLabel)
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(35)
        }
        
        heatSlider.snp.makeConstraints { make in
            make.top.equalTo(styleHashTagCollectionView.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        coldSlider.snp.makeConstraints { make in
            make.top.equalTo(heatSlider.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        myPagePostPageView.snp.makeConstraints { make in
            make.top.equalTo(coldSlider.snp.bottom).offset(20)      // 임시 수정
            make.leading.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }

    }
}
