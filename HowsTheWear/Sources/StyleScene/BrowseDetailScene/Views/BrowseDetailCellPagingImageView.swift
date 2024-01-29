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
    
    private let pagingImageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        $0.collectionViewLayout = layout
    }
    
//    private let imagePageControl = UIPageControl()
    
    private let imagePageControl: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureInitialSetting()
        configureSubview()
        configureLayout()
    }
    
}

// MARK: - Configure InitialSetting
extension BrowseDetailCellPagingImageView {
    private func configureInitialSetting() {
        pagingImageCollectionView.dataSource = self
        pagingImageCollectionView.delegate = self
        pagingImageCollectionView.register(PagingImageCollectionViewCell.self, forCellWithReuseIdentifier: "PagingImageCollectionViewCell")
        pagingImageCollectionView.isPagingEnabled = true
        pagingImageCollectionView.showsHorizontalScrollIndicator = true
    }
    
}

// MARK: Public Interface
extension BrowseDetailCellPagingImageView {
    func configureContents(_ images: [UIImage?]) {
        self.images = images
    }
    
}

// MARK: UIScrollView Delegate Implementation
extension BrowseDetailCellPagingImageView {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width

        if width != 0 {
            let currentPosition = scrollView.contentOffset.x / width
            imagePageControl.currentPage = Int(currentPosition)
        }
    }
    
}

// MARK: UICollectionView Delegate FlowLayout Implementation
extension BrowseDetailCellPagingImageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->
    CGSize {
        let width: CGFloat = collectionView.bounds.width
        let height: CGFloat = collectionView.bounds.height
        
        return CGSize(width: width, height: height)
    }
    
}

// MARK: UICollectionView DataSource Implementation
extension BrowseDetailCellPagingImageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PagingImageCollectionViewCell", for: indexPath) as? PagingImageCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.pagingImageView.image = images[indexPath.row]
        return cell
    }
    
}

// MARK: Configure UI
extension BrowseDetailCellPagingImageView {
    private func configurePageControl() {
        imagePageControl.numberOfPages = images.count
        imagePageControl.hidesForSinglePage = true
    }
    
    private func configureSubview() {
        [pagingImageCollectionView, imagePageControl].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        pagingImageCollectionView.snp.makeConstraints { make in
            make.margins.equalTo(safeArea)
        }
        
        imagePageControl.snp.makeConstraints { make in
            make.top.equalTo(pagingImageCollectionView.snp.bottom)
            make.centerX.equalTo(safeArea.snp.centerX)
            make.height.equalTo(safeArea).multipliedBy(0.05)
        }
    }
    
}
