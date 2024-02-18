//
//  BrowseMainCollectionView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/4/24.
//

import UIKit

final class BrowseMainCollectionView: UIView {
    
    weak var delegate: browseCollectionReusableDelegate?
    
    var didSelectCell: ((IndexPath) -> Void)?

    private var thisWeekStyleArray:[BrowseStyleDataModel] = []
    private var nextWeekStyleArray:[BrowseStyleDataModel] = []
    private var lastYearStyleArray:[BrowseStyleDataModel] = []
    private let browseStyleDataManager = BrowseStyleDataManager()

    private var isHiddenCellUserId = false
    
    private var sectionCount = 0
    
    private var sectionTitlesArray: [String] = []
    
    private var imageArray: [[BrowseStyleDataModel]] = [] {
        didSet {
            browseCollectionView.reloadData()
        }
    }

    lazy var browseCollectionView = UICollectionView(frame: .zero, collectionViewLayout: generateCollectionViewLayout())

    init(isHiddenCellUserID: Bool) {
        super.init(frame: .zero)
        configureCollectionView()
        configureSubViews()
        configureLayout()
        isHiddenCellUserId = isHiddenCellUserID
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Public Interface

extension BrowseMainCollectionView {
    func configureContents(sectionCount count: Int, sectionTitles titles: [String]) {
        sectionCount = count
        self.sectionTitlesArray = titles
    }
    
}

// MARK: - Configure CollectionView

extension BrowseMainCollectionView {
    
    private func configureCollectionView() {
        browseCollectionView.dataSource = self
        browseCollectionView.delegate = self
        browseCollectionView.register(BrowseCollectionViewCell.self, forCellWithReuseIdentifier: BrowseCollectionViewCell.reuseIdentifier)
//        browseCollectionView.register(BrowseMoreCollectionViewCell.self, forCellWithReuseIdentifier: BrowseMoreCollectionViewCell.reuseIdentifier)
        browseCollectionView.backgroundColor = .clear
        
        browseCollectionView.register(BrowseCollectionReusableView.self,
                                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                      withReuseIdentifier: BrowseCollectionReusableView.reuseIdentifier)
        
        thisWeekStyleArray = browseStyleDataManager.fetchThisWeekImagesData()
        nextWeekStyleArray = browseStyleDataManager.fetchNextWeekImagesData()
        lastYearStyleArray = browseStyleDataManager.fetchLastYearImagesData()
        
        imageArray = [thisWeekStyleArray, nextWeekStyleArray, lastYearStyleArray]
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
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
// 더보기 버튼 미구현
//        if indexPath.item == 10 {
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: BrowseMoreCollectionViewCell.reuseIdentifier,
//                for: indexPath
//            ) as? BrowseMoreCollectionViewCell else { return UICollectionViewCell() }
//            
//            return cell
//        } else {
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: BrowseCollectionViewCell.reuseIdentifier,
//                for: indexPath
//            ) as? BrowseCollectionViewCell else { return UICollectionViewCell() }
//            
//            let section = indexPath.section
//            
//            if indexPath.item < imageArray[section].count {
//                  cell.styleImageView.image = imageArray[section][indexPath.item]
//              }      
//            
//            cell.browseCollectionViewCellUserIDLabel.isHidden = isHiddenCellUserId
//
//            return cell
//        }
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BrowseCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? BrowseCollectionViewCell else { return UICollectionViewCell() }
       
        let section = indexPath.section
       
        if indexPath.item < imageArray[section].count {
            cell.styleImageView.image = imageArray[section][indexPath.item].images
        }
       
        cell.browseCollectionViewCellUserIDLabel.isHidden = isHiddenCellUserId

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

// MARK: - Implement CollectionView Delegate

extension BrowseMainCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectCell?(indexPath)
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
