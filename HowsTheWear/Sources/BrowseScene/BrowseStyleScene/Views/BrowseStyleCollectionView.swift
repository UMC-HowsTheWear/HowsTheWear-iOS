//
//  BrowseStyleCollectionView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/4/24.
//

import UIKit

final class BrowseStyleCollectionView: UIView {
    
    private var cellImageCorenerRadius: CGFloat = 0
    
    var didSelectCell: ((IndexPath) -> Void)?
    
    private var imageArray: [BrowseStyleDataModel] = [] {
        didSet {
            browseStyleCollectionView.reloadData()
        }
    }
    
    private lazy var browseStyleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: generateCollectionViewLayout())

    init(cellImageCorenerRadius: CGFloat) {
        super.init(frame: .zero)
        configureCollectionView()
        configureSubview()
        configureLayout()
        self.cellImageCorenerRadius = cellImageCorenerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Public Interface
extension BrowseStyleCollectionView {
    func configureContents(_ images: [BrowseStyleDataModel]) {
        self.imageArray = images
    }
    
}

// MARK: - Configure UICollectionView
extension BrowseStyleCollectionView {
    private func configureCollectionView() {
        browseStyleCollectionView.dataSource = self
        browseStyleCollectionView.delegate = self
        
        browseStyleCollectionView.register(BrowseCollectionViewCell.self, forCellWithReuseIdentifier: BrowseCollectionViewCell.reuseIdentifier)
        browseStyleCollectionView.register(StyleCollectionReusableHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StyleCollectionReusableHeaderView.reuseIdentifier)
        
        browseStyleCollectionView.backgroundColor = .clear
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
        let headerHeight: CGFloat = screenHeight >= 890 ? 45 : 35
        
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

// MARK: - Implement CollectionView DataSource

extension BrowseStyleCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BrowseCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? BrowseCollectionViewCell else { return UICollectionViewCell() }
        
        cell.styleImageView.image = imageArray[indexPath.item].images
        cell.styleImageView.layer.cornerRadius = cellImageCorenerRadius
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StyleCollectionReusableHeaderView.reuseIdentifier, for: indexPath) as? StyleCollectionReusableHeaderView else {
            fatalError("Cannot create new supplementary")
        }
        
        return headerView
    }
    
}

// MARK: - Implement CollectionView Delegate

extension BrowseStyleCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectCell?(indexPath)
    }
}

// MARK: - Configure UI
extension BrowseStyleCollectionView {
    private func configureSubview() {
        addSubview(browseStyleCollectionView)
    }
    
    private func configureLayout() {
        browseStyleCollectionView.snp.makeConstraints { make in
            make.margins.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
