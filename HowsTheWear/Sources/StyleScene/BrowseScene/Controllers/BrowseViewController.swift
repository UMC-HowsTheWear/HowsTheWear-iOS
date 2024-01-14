//
//  BrowseViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/2/24.
//

import SnapKit
import UIKit

class BrowseViewController: UIViewController {
    
    private var thisWeekStyleArray = [UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage")]
    
    private var nextWeekStyleArray = [UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage"),
                                    UIImage(named: "StyleTestImage")]
    
    private var lastYearStyleArray = [UIImage(named: "StyleTestImage"),
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
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.32),
            heightDimension: .estimated(150)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // screen의 height가 890 이상일 시 (XR, Plus, Max기종) header의 높이를 65로 설정 나머지는 35로 설정.
        let screenHeight = UIScreen.main.bounds.height
        let headerHeight: CGFloat = screenHeight >= 892 ? 65 : 35
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(headerHeight))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [headerElement]

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
        
        browseCollectionView.register(BrowseCollectionReusableView.self,
                                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                      withReuseIdentifier: BrowseCollectionReusableView.reuseIdentifier)
        // 모델, 데이터매니저 구현 후 데이터 받아오는 메서드 작성예정
    }
}

// MARK: - Implementation CollectionView DataSource

extension BrowseViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return thisWeekStyleArray.count
        case 1:
            return nextWeekStyleArray.count
        case 2:
            return lastYearStyleArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "browseCollectionViewCell", for: indexPath) as? BrowseCollectionViewCell else { return UICollectionViewCell() }
        
        let section = indexPath.section
        
        switch section {
        case 0:
            cell.styleImageView.image = thisWeekStyleArray[indexPath.item]
        case 1:
            cell.styleImageView.image = nextWeekStyleArray[indexPath.item]
        case 2:
            cell.styleImageView.image = lastYearStyleArray[indexPath.item]
        default:
            fatalError()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: BrowseCollectionReusableView.reuseIdentifier,
            for: indexPath) as? BrowseCollectionReusableView else { fatalError("Cannot create new supplementary") }
        return headerView
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
            make.trailing.equalTo(safeArea.snp.trailing)
        }
    }
}
