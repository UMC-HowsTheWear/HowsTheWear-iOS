//
//  WeeklyWeatherCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import UIKit

import SnapKit
import Then

class WeeklyWeatherCell: UITableViewCell {
    
    static let identifier = "WeeklyWeatherCell"
    static let cellHeight = 530.0
    
    private var weeklyData = Weekly.lists
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.register(WeeklyCollectionCell.self, forCellWithReuseIdentifier: WeeklyCollectionCell.identifier)
        return collectionView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
        contentView.layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowRadius = 20
        layer.shadowOpacity = 0.15
        layer.masksToBounds = false
        
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(50)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}

extension WeeklyWeatherCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weeklyData.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WeeklyCollectionCell.identifier,
            for: indexPath
        ) as? WeeklyCollectionCell else {
            return UICollectionViewCell()
        }
        let data = weeklyData[indexPath.item]
        cell.prepare(data: data)
        return cell
    }
    
}

extension WeeklyWeatherCell: UICollectionViewDelegate {
    
}
