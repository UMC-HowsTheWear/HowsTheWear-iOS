//
//  BrowseCollectionViewCell.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/2/24.
//

import Then
import UIKit


final class BrowseCollectionViewCell: UICollectionViewCell {
    
    private let styleImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "StyleTestImage")
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

extension BrowseCollectionViewCell {
    
    private func configureSubviews() {
        addSubview(styleImageView)
        styleImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        styleImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
