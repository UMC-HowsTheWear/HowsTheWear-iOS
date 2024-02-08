//
//  BrowseMainCollectionView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/4/24.
//

import UIKit

final class BrowseMainCollectionView: UIView {
    
    weak var delegate: browseCollectionReusableDelegate?
    
    private var sectionCount = 0
    
    private var sectionTitlesArray: [String] = []
    
    private var imageArray: [[UIImage?]] = [] {
        didSet {
            browseCollectionView.reloadData()
        }
    }

    lazy var browseCollectionView = UICollectionView(frame: .zero, collectionViewLayout: generateCollectionViewLayout())

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCollectionView()
        configureSubViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Public Interface

extension BrowseMainCollectionView {
    func configureContents(sectionCount count: Int,imagesData images: [[UIImage?]], sectionTitles titles: [String]) {
        sectionCount = count
        self.imageArray = images
        self.sectionTitlesArray = titles
    }
    
}

// MARK: - Configure CollectionView

extension BrowseMainCollectionView {
    
    private func configureCollectionView() {
        browseCollectionView.dataSource = self
        browseCollectionView.register(BrowseCollectionViewCell.self, forCellWithReuseIdentifier: BrowseCollectionViewCell.reuseIdentifier)
        browseCollectionView.backgroundColor = .clear
        
        browseCollectionView.register(BrowseCollectionReusableView.self,
                                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                      withReuseIdentifier: BrowseCollectionReusableView.reuseIdentifier)
        // 모델, 데이터매니저 구현 후 데이터 받아오는 메서드 작성예정
    }

    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.32),
            heightDimension: .estimated(136)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // screen의 height가 890 이상일 시 (XR, Plus, Max기종) header의 높이를 65로 설정 나머지는 35로 설정.
        let screenHeight = UIScreen.main.bounds.height
        let headerHeight: CGFloat = screenHeight >= 890 ? 65 : 35
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(headerHeight))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 0, bottom: 30, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [headerElement]

        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}

// MARK: - Implementation CollectionView DataSource

extension BrowseMainCollectionView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard section < imageArray.count else {
            return 0
        }
        
        return imageArray[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BrowseCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? BrowseCollectionViewCell else { return UICollectionViewCell() }
        
        let section = indexPath.section
        
        cell.styleImageView.image = imageArray[section][indexPath.item]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: BrowseCollectionReusableView.reuseIdentifier,
            for: indexPath) as? BrowseCollectionReusableView else { fatalError("Cannot create new supplementary") }
        
        headerView.browseHeaderRightArrowButton.tag = indexPath.section
        headerView.delegate = delegate
        
        if indexPath.section < sectionTitlesArray.count {
            headerView.browseHeaderLabel.text = sectionTitlesArray[indexPath.section]
        }
        
        return headerView
    }
    
}

// MARK: - Configure UI

extension BrowseMainCollectionView {
    
    private func configureSubViews() {
        addSubview(browseCollectionView)
    }
    
    private func configureLayout() {
        browseCollectionView.snp.makeConstraints { make in
            make.margins.equalToSuperview()
        }
    }
    
}
