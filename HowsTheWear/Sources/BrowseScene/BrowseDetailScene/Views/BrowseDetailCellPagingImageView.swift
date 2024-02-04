//
//  BrowseDetailCellPagingImageView.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/28/24.
//

import UIKit

final class BrowseDetailCellPagingImageView: UIView {
    private var images: [UIImage?] = [] {
        didSet {
            configurePageControl()
            pagingImageCollectionView.reloadData()
        }
    }
    
    private let pagingImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        return collectionView
    }()
    
    private let imagePageControl = UIPageControl()
    
    convenience init() {
        self.init(frame: .zero)
        configureInitialSetting()
        configurePagingImageCollectionView()
        configureSubview()
        configureLayout()
    }
    
}

// MARK: - Public Interface
extension BrowseDetailCellPagingImageView {
    func configureContents(_ images: [UIImage?]) {
        self.images = images
    }
    
}

// MARK: - Configure InitialSetting
extension BrowseDetailCellPagingImageView {
    private func configureInitialSetting() {
        imagePageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.3137255013, green: 0.3137254715, blue: 0.3137255013, alpha: 1)
        imagePageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9411764741, green: 0.9411764741, blue: 0.9411764741, alpha: 1)
    }
    
}

// MARK: - Implement UIScrollView Delegate
extension BrowseDetailCellPagingImageView {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width

        if width != 0 {
            let currentPosition = scrollView.contentOffset.x / width
            imagePageControl.currentPage = Int(currentPosition)
        }
    }
    
}

// MARK: - Implement UICollectionView Delegate FlowLayout
extension BrowseDetailCellPagingImageView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width: CGFloat = collectionView.bounds.width
        let height: CGFloat = collectionView.bounds.height
        
        return CGSize(width: width, height: height)
    }
    
}

// MARK: - Implement UICollectionView DataSource
extension BrowseDetailCellPagingImageView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return images.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PagingImageCollectionViewCell",
            for: indexPath
        ) as? PagingImageCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.pagingImageView.image = images[indexPath.row]
        return cell
    }
    
}

// MARK: - Configure UI
extension BrowseDetailCellPagingImageView {
    private func configurePageControl() {
        imagePageControl.numberOfPages = images.count
        imagePageControl.hidesForSinglePage = true
    }
    
    private func configurePagingImageCollectionView() {
        pagingImageCollectionView.dataSource = self
        pagingImageCollectionView.delegate = self
        pagingImageCollectionView.register(
            PagingImageCollectionViewCell.self,
            forCellWithReuseIdentifier: "PagingImageCollectionViewCell"
        )
        
        pagingImageCollectionView.isPagingEnabled = true
        pagingImageCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureSubview() {
        [pagingImageCollectionView, imagePageControl].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        pagingImageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(safeAreaLayoutGuide.snp.height)
        }
        
        imagePageControl.snp.makeConstraints { make in
            make.top.equalTo(pagingImageCollectionView.snp.bottom)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.05)
        }
    }
    
}
