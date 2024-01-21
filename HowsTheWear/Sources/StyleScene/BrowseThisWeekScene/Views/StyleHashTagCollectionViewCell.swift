//
//  StyleHashTagCollectionViewCell.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/21/24.
//

import UIKit

final class StyleHashTagCollectionViewCell: UICollectionViewCell {
    
    let styleHashTagLabel = UILabel().then {
        $0.font = UIFont.pretendard(size: 13, weight: .medium)
        $0.text = "미니멀"
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure UI

extension StyleHashTagCollectionViewCell {
    
    private func configureSubviews() {
        contentView.addSubview(styleHashTagLabel)
    }
    
    private func configureLayout() {
        styleHashTagLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
