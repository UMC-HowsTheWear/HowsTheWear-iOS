//
//  BrowseThisWeekViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/21/24.
//

import UIKit

final class BrowseThisWeekViewController: UIViewController {
    
    private var thisWeekStyleArray = [UIImage(named: "ThisWeekTestImage"),
                                    UIImage(named: "ThisWeekTestImage"),
                                    UIImage(named: "ThisWeekTestImage"),
                                    UIImage(named: "ThisWeekTestImage"),
                                    UIImage(named: "ThisWeekTestImage"),
                                    UIImage(named: "ThisWeekTestImage"),
                                    UIImage(named: "ThisWeekTestImage"),
                                    UIImage(named: "ThisWeekTestImage")]
    
    private let thisWeekHashTagView = StyleHashTagView()

    private lazy var ThisWeekCollectionView = UICollectionView(frame: .zero, collectionViewLayout: generateCollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureSubViews()
        configureLayout()
    }
    
}

// MARK: - Configure CollectionView

extension BrowseThisWeekViewController {
    
    private func configureCollectionView() {
        ThisWeekCollectionView.dataSource = self
        ThisWeekCollectionView.register(BrowseCollectionViewCell.self, forCellWithReuseIdentifier: "browseCollectionViewCell")
        ThisWeekCollectionView.register(ThisWeekCollectionReusableView.self,
                                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                      withReuseIdentifier: ThisWeekCollectionReusableView.reuseIdentifier)
        
        ThisWeekCollectionView.backgroundColor = .clear

        // 모델, 데이터매니저 구현 후 데이터 받아오는 메서드 작성예정
    }

    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.417)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let screenHeight = UIScreen.main.bounds.height
        let headerHeight: CGFloat = screenHeight >= 890 ? 40 : 30
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(headerHeight))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerElement]

        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}

// MARK: - Implementation CollectionView DataSource

extension BrowseThisWeekViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thisWeekStyleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "browseCollectionViewCell", for: indexPath) as? BrowseCollectionViewCell else { return UICollectionViewCell() }
        
        cell.styleImageView.image = thisWeekStyleArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: ThisWeekCollectionReusableView.reuseIdentifier,
            for: indexPath) as? ThisWeekCollectionReusableView else { fatalError("Cannot create new supplementary") }
        return headerView
    }
    
}

// MARK: - Configure UI

extension BrowseThisWeekViewController {
    
    private func configureSubViews() {
        [ThisWeekCollectionView, thisWeekHashTagView].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        thisWeekHashTagView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top)
            make.leading.equalTo(safeArea.snp.leading).offset(20)
            make.trailing.equalTo(safeArea.snp.trailing)
            make.height.equalTo(30)
        }
        
        ThisWeekCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(50)
            make.bottom.equalTo(safeArea.snp.bottom).offset(13)
            make.leading.equalTo(safeArea.snp.leading).offset(20)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-20)
        }
    }
    
}

