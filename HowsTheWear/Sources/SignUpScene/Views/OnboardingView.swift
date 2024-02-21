//
//  OnboardingView.swift
//  HowsTheWear
//
//  Created by RAFA on 2/21/24.
//

import UIKit

import SnapKit
import Then

final class OnboardingView: UIView {
    
    private let backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "background-image")
        $0.contentMode = .scaleAspectFill
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = UIScreen.main.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        return collectionView
    }()
    
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPageIndicatorTintColor = #colorLiteral(red: 0.3147028089, green: 0.3147028089, blue: 0.3147028089, alpha: 1)
        control.pageIndicatorTintColor = #colorLiteral(red: 0.7225670298, green: 0.7183903417, blue: 0.7267437178, alpha: 1)
        control.currentPage = 0
        control.numberOfPages = Onboarding.items.count
        control.hidesForSinglePage = true
        control.isUserInteractionEnabled = false
        return control
    }()
    
    let loginButton = UIButton().then {
        $0.backgroundColor = .black
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 13
        $0.setAttributedTitle(
            NSAttributedString(
                string: "로그인하기",
                attributes: [
                    .font: UIFont.pretendard(size: 14, weight: .medium),
                    .foregroundColor: UIColor.white
                ]
            ), for: .normal
        )
    }
    
    let joinButton = UIButton().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 13
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.setAttributedTitle(
            NSAttributedString(
                string: "회원가입하기",
                attributes: [
                    .font: UIFont.pretendard(size: 14, weight: .medium),
                    .foregroundColor: UIColor.black
                ]
            ), for: .normal
        )
    }
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginButton, joinButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        return stackView
    }()
    
    let startAsNonMemberButton = UIButton().then {
        $0.setAttributedTitle(NSAttributedString(string: "비회원으로 시작하기", attributes: [.font: UIFont.pretendard(size: 13, weight: .medium), .foregroundColor: UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)]), for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        collectionView.backgroundColor = .clear
        addSubviews([backgroundImageView, collectionView, pageControl, buttonStackView, startAsNonMemberButton])
        setupConstraints()
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pageControl.snp.bottom).offset(40)
            $0.left.equalTo(20)
        }
        
        startAsNonMemberButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(buttonStackView.snp.bottom).offset(16)
            $0.left.equalTo(buttonStackView)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(20)
        }
    }
    
}
