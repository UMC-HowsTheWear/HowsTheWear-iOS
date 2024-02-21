//
//  BrowseCollectionReusableView.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/13/24.
//

import UIKit

import SnapKit

// BrowseCollectionView Header View

protocol browseCollectionReusableDelegate: AnyObject {
    func browseHeaderRightArrowButtonTapped(section: Int)
    
}

final class BrowseCollectionReusableView: UICollectionReusableView {
    
    weak var delegate: browseCollectionReusableDelegate?
        
    let browseHeaderLabel = UILabel().then {
        $0.font = UIFont.pretendard(size: 15, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    let browseHeaderRightArrowButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.tintColor = .black
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureLayout()
        configureAddTarget()
        
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight >= 890 {
            browseHeaderLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure Action
extension BrowseCollectionReusableView {
    private func configureAddTarget() {
        browseHeaderRightArrowButton.addTarget(self, action: #selector(rightArrowButtonAction), for: .touchUpInside)
    }
    
    @objc private func rightArrowButtonAction() {
        delegate?.browseHeaderRightArrowButtonTapped(section: browseHeaderRightArrowButton.tag)
    }
}

// MARK: - Configure UI
extension BrowseCollectionReusableView {
    
    private func configureSubviews() {
        [browseHeaderLabel, browseHeaderRightArrowButton].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        browseHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.bottom.equalToSuperview()
        }
        
        browseHeaderRightArrowButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
}
