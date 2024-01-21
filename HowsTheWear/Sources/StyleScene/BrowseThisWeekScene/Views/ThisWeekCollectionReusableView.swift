//
//  ThisWeekCollectionReusableView.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/21/24.
//

import UIKit

import SnapKit

// BrowseCollectionView Header View

final class ThisWeekCollectionReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = "thisWeekCollectionViewHeader"
    
    let ThisWeekWeeklyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.text = "1월 둘째 주"
    }
    
    let ThisWeekDateRangeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.text = "2024년 1월 7일 ~ 1월 13일"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureLayout()
        
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight >= 890 {
            [ThisWeekWeeklyLabel, ThisWeekDateRangeLabel].forEach {
                $0.font = .systemFont(ofSize: 16, weight: .semibold)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure UI
extension ThisWeekCollectionReusableView {
    
    private func configureSubviews() {
        [ThisWeekWeeklyLabel, ThisWeekDateRangeLabel].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        ThisWeekWeeklyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.bottom.equalToSuperview()
        }
        
        ThisWeekDateRangeLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
}
