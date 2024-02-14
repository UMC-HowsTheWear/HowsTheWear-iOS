//
//  TodayItemCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import UIKit

import SnapKit
import Then

final class TodayItemCell: UITableViewCell {
    
    static let cellHeight = 120.0
    
    private let subtitleLabel = UILabel().then {
        $0.text = "Hows The Wear"
        $0.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        $0.textAlignment = .left
        $0.font = .pretendard(size: 13, weight: .medium)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "오늘의 아이템"
        $0.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
        $0.textAlignment = .left
        $0.font = .pretendard(size: 16, weight: .bold)
    }

    private lazy var titleView = UIStackView(arrangedSubviews: [subtitleLabel, titleLabel]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 5
    }
    
    private let itemStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 20
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        let path = UIBezierPath(
            roundedRect: contentView.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 30, height: 30)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        contentView.layer.mask = maskLayer
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UI Configuration

private extension TodayItemCell {
    
    func configureUI() {
        setupContentView()
        setupUI()
    }
    
    func setupContentView() {
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        contentView.addSubview(titleView)
        contentView.addSubview(itemStackView)
    }
    
    func setupUI() {
        createItemView(with: "가방", imageName: "1")
        createItemView(with: "아우터", imageName: "2")
        createItemView(with: "시계", imageName: "3")

        titleView.snp.makeConstraints {
            $0.centerY.equalTo(itemStackView)
            $0.left.equalTo(40)
        }
        
        itemStackView.snp.makeConstraints {
            $0.top.equalTo(20)
            $0.right.equalTo(-40)
            $0.bottom.equalTo(-20)
        }
    }
    
}

// MARK: - Helper Methods for UI

private extension TodayItemCell {
    
    func createItemView(with title: String, imageName: String) {
        let imageView = UIImageView().then {
            $0.image = UIImage(named: imageName)
            $0.contentMode = .scaleAspectFit
        }

        let itemLabel = UILabel().then {
            $0.text = title
            $0.textAlignment = .center
            $0.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
            $0.font = .pretendard(size: 13, weight: .medium)
        }
        
        let itemView = UIStackView(arrangedSubviews: [imageView, itemLabel])
        itemView.axis = .vertical
        itemView.alignment = .center
        itemView.distribution = .fillProportionally
        itemView.spacing = 5

        itemStackView.addArrangedSubview(itemView)
    }
    
}
