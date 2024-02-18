//
//  MyPagePostCollectionViewCell.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/18/24.
//

import UIKit

final class MyPagePostCollectionViewCell: UICollectionViewCell {
    
    var postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}

extension MyPagePostCollectionViewCell {
    
    private func configureSubview() {
        contentView.addSubview(postImageView)
    }
    
    private func configureConstraints() {
        postImageView.snp.makeConstraints { make in
            make.margins.equalToSuperview()
        }
    }
    
}
