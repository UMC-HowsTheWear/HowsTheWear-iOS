//
//  TodayItemCollectionCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import UIKit

import SnapKit
import Then

class TodayItemCollectionCell: UICollectionViewCell {
    
    static let identifier = "TodayItemCollectionCell"
    
    private let itemImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let itemLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        $0.textAlignment = .center
    }
    
    lazy var itemView = UIStackView(arrangedSubviews: [itemImageView, itemLabel]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(itemView)
        
        itemView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(data: TodayItem) {
        itemImageView.image = UIImage(named: data.image)
        itemLabel.text = data.name
    }
    
}
