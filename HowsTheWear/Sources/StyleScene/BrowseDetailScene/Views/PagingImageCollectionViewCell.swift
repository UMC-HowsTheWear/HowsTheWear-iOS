//
//  PagingImageCollectionViewCell.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/28/24.
//

import UIKit

final class PagingImageCollectionViewCell: UICollectionViewCell {
    
    let pagingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Configure UI
extension PagingImageCollectionViewCell {
    private func configureSubview() {
        contentView.addSubview(pagingImageView)
    }
    
    private func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        pagingImageView.snp.makeConstraints { make in
            make.margins.equalToSuperview()
        }
    }
    
}
