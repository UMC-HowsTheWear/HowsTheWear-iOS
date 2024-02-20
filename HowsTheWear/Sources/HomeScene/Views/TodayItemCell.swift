//
//  TodayItemCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import Foundation
import UIKit

import SnapKit
import Then

final class TodayItemCell: UITableViewCell {
    
    static let cellHeight = 120.0
    
    var temperature: Double = 0.0
    var precipitationProbability: Double = 0.0
    
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
        $0.font = .pretendard(size: 16, weight: .semibold)
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

extension TodayItemCell {
    
    func configureUI() {
        setupContentView()
        setupUI()
    }
    
    func configure(with temperature: Double, precipitationIntensity: Double) {
        self.temperature = temperature
        self.precipitationProbability = precipitationIntensity
    }
    
    func setupContentView() {
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        contentView.addSubview(titleView)
        contentView.addSubview(itemStackView)
    }
    
    func setupUI() {
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

extension TodayItemCell {
    
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

extension TodayItemCell {
    
    func setRecommendedItems(temperature: Double, precipitationProbability: Double) {
        itemStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // 온도에 따른 아이템 설정
        switch temperature {
        case 21...:
            print("온도: \(temperature)°C, 추천 아이템: 반팔, 반바지")
            createItemView(with: "반팔", imageName: "shortSleeves")
            createItemView(with: "반바지", imageName: "shorts")
        case 16..<21:
            print("온도: \(temperature)°C, 추천 아이템: 긴팔, 긴바지")
            createItemView(with: "긴팔", imageName: "longSleeves")
            createItemView(with: "긴바지", imageName: "longPants")
        case 11..<16:
            print("온도: \(temperature)°C, 추천 아이템: 아우터, 긴팔, 긴바지")
            createItemView(with: "아우터", imageName: "outer")
            createItemView(with: "긴팔", imageName: "longSleeves")
            createItemView(with: "긴바지", imageName: "longPants")
        case 6..<11:
            print("온도: \(temperature)°C, 추천 아이템: 아우터, 니트, 긴바지")
            createItemView(with: "아우터", imageName: "outer")
            createItemView(with: "니트", imageName: "knit")
            createItemView(with: "긴바지", imageName: "longPants")
        case 1..<6:
            print("온도: \(temperature)°C, 추천 아이템: 패딩, 니트, 긴바지")
            createItemView(with: "패딩", imageName: "padding")
            createItemView(with: "니트", imageName: "knit")
            createItemView(with: "긴바지", imageName: "longPants")
        case ...0:
            print("온도: \(temperature)°C, 추천 아이템: 패딩, 긴바지, 목도리")
            createItemView(with: "패딩", imageName: "padding")
            createItemView(with: "긴바지", imageName: "longPants")
            createItemView(with: "목도리", imageName: "scarf")
        default:
            break
        }
        
        // 강수량이 4mm 이상이면 우산 추가
        if precipitationProbability >= 4.00 {
            print("강수 확률: \(precipitationProbability)%, 우산 추가")
            createItemView(with: "우산", imageName: "umbrella")
        }
        
        // 아이템이 4개 이상일 경우 우산 제외하고 나머지 중 하나를 무작위로 제거
        if itemStackView.arrangedSubviews.count > 3 {
            removeRandomItemExcludingUmbrella()
        }
    }
    
    func removeRandomItemExcludingUmbrella() {
        let nonUmbrellaItems = itemStackView.arrangedSubviews.filter {
            guard let stackView = $0 as? UIStackView,
                  let label = stackView.arrangedSubviews.last as? UILabel else { return false }
            return label.text != "우산"
        }
        
        if let itemToRemove = nonUmbrellaItems.randomElement() {
            itemStackView.removeArrangedSubview(itemToRemove)
            itemToRemove.removeFromSuperview()
        }
    }
    
    // 아이템 추가를 위한 보조 메서드
    func addItems(_ items: (String, String)...) {
        for item in items where itemStackView.arrangedSubviews.count < 3 {
            createItemView(with: item.0, imageName: item.1)
        }
    }
    
}
