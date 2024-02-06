//
//  DailyWeatherCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import UIKit

import SnapKit
import Then

final class DailyWeatherCell: UITableViewCell {
    
    static let cellHeight = 100.0
    
    var dailyData: [Daily] = Daily.lists
    
    private let shadowContainerView = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowRadius = 20
        $0.layer.shadowOpacity = 1
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            DailyCollectionCell.self,
            forCellWithReuseIdentifier: DailyCollectionCell.reuseIdentifier
        )
        return collectionView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UICollectionViewDataSource

extension DailyWeatherCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyCollectionCell.reuseIdentifier, for: indexPath) as? DailyCollectionCell else {
            return UICollectionViewCell()
        }
        let data = dailyData[indexPath.item]
        cell.prepare(data: data)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension DailyWeatherCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let dailyCollectionCell = cell as? DailyCollectionCell else { return }
        let data = dailyData[indexPath.item]
        dailyCollectionCell.prepare(data: data)
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let dailyCollectionCell = cell as? DailyCollectionCell else { return }
        let data = dailyData[indexPath.item]
        dailyCollectionCell.prepare(data: data)
    }
    
}

// MARK: - UI Configuration

private extension DailyWeatherCell {
    
    func configureUI() {
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        contentView.addSubview(shadowContainerView)
        shadowContainerView.snp.makeConstraints {
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.top.bottom.equalToSuperview()
        }

        shadowContainerView.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 20
        collectionView.clipsToBounds = true
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(40)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 40
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}
