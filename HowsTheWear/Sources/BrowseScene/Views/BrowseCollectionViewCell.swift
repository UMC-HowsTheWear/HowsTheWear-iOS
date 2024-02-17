//
//  BrowseCollectionViewCell.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/2/24.
//

import UIKit

import Then

final class BrowseCollectionViewCell: UICollectionViewCell {
    
    let styleImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "StyleTestImage")
    }
    
    let browseCollectionViewCellUserIDLabel = UILabel().then {
        $0.font = UIFont.pretendard(size: 12, weight: .medium)
        $0.textColor = .white
        $0.numberOfLines = 1
        $0.textAlignment = .left
        $0.lineBreakMode = .byTruncatingTail
        $0.isHidden = true
        $0.text = "@alalal"
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

// MARK: - Public Interface

extension BrowseCollectionViewCell {
    
    func configureCellContents(isHiddenUserIDLabel: Bool) {
        browseCollectionViewCellUserIDLabel.isHidden = isHiddenUserIDLabel
    }
    
}


// MARK: - Configure UI

extension BrowseCollectionViewCell {
    
    private func configureSubviews() {
        [styleImageView, browseCollectionViewCellUserIDLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func configureLayout() {
        styleImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        browseCollectionViewCellUserIDLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(2)
            make.leading.equalToSuperview().inset(8)
        }
    }

}
