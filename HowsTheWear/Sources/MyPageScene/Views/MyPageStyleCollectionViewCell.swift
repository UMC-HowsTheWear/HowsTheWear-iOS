//
//  MyPageStyleCollectionViewCell.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/15/24.
//

import UIKit

final class MyPageStyleCollectionViewCell: UICollectionViewCell {
    
    let styleHashTagLabel = UILabel().then {
        $0.text = "hi"
        $0.textColor = UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1)
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.textAlignment = .center
        $0.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        styleHashTagLabel.layer.cornerRadius = frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure UI
extension MyPageStyleCollectionViewCell {
    
    private func configureSubviews() {
        contentView.addSubview(styleHashTagLabel)
    }
    
    private func configureLayout() {
        styleHashTagLabel.snp.makeConstraints { make in
            make.margins.equalToSuperview()
        }
    }
    
}
