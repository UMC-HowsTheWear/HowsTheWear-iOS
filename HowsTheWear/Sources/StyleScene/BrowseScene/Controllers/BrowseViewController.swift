//
//  BrowseViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/2/24.
//

import SnapKit
import UIKit

class BrowseViewController: UIViewController {
    
    private var browseImageArray = [UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage")]

    private lazy var browseCollectionView = UICollectionView(frame: .zero, collectionViewLayout: generateCollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureSubViews()
        configureLayout()
    }
}

// MARK: - Configure CollectionView

extension BrowseViewController {
    
    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(105),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.3)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.15)
        )

        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerElement]
        section.orthogonalScrollingBehavior = .continuous

        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

// MARK: - Configure CollectionView

extension BrowseViewController {
    
    private func configureCollectionView() {
        browseCollectionView.dataSource = self
        browseCollectionView.register(BrowseCollectionViewCell.self, forCellWithReuseIdentifier: "browseCollectionViewCell")
        browseCollectionView.backgroundColor = .clear
        
        // 모델, 데이터매니저 구현 후 데이터 받아오는 메서드 작성예정
    }
}

// MARK: - Implementation CollectionView DataSource

extension BrowseViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return browseImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "browseCollectionViewCell",
            for: indexPath
        ) as? BrowseCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.styleImageView.image = browseImageArray[indexPath.item]
        
        return cell
    }
}

// MARK: - Configure UI

extension BrowseViewController {
    
    private func configureSubViews() {
        [browseCollectionView].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        browseCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(30)
            make.bottom.equalTo(safeArea.snp.bottom)
            make.leading.equalTo(safeArea.snp.leading).offset(15)
            make.trailing.equalTo(safeArea.snp.trailing).offset(15)
        }
    }
}
