//
//  StyleHashTagView.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/21/24.
//

import UIKit

final class StyleHashTagView: UIView {

    private var hashTags: [String?] = ["미니멀", "캐쥬얼", "스트릿", "페미닌", "스포티", "빈티지", "뉴트로"] {
        didSet {
            hashTagCollectionView.reloadData()
        }
    }
    
    let hashTagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configurePagingImageCollectionView()
        configureSubview()
        configureLayout()
        hashTagCollectionView.delegate = self
    }
    
}

// MARK: Public Interface
extension StyleHashTagView {
    func configureContents(_ text: [String?]) {
        self.hashTags = text
    }
    
}

// MARK: - Configure CollectionView
extension StyleHashTagView {
    private func configurePagingImageCollectionView() {
        hashTagCollectionView.dataSource = self
        hashTagCollectionView.delegate = self
        hashTagCollectionView.register(StyleHashTagCollectionViewCell.self, forCellWithReuseIdentifier: "StyleHashTagCollectionViewCell")
        hashTagCollectionView.showsHorizontalScrollIndicator = false
    }
    
}

// MARK: UIScrollView Delegate Implementation
//extension StyleHashTagView {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        let width = scrollView.frame.width
//
//        if width != 0 {
//            let currentPosition = scrollView.contentOffset.x / width
//            imagePageControl.currentPage = Int(currentPosition)
//        }
//    }
//
//}

// MARK: UICollectionView Delegate FlowLayout Implementation

extension StyleHashTagView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        let text = hashTags[indexPath.row] ?? ""
        let cellWidth = text.size(withAttributes:[.font: UIFont.systemFont(ofSize:13)]).width + 32 // 여백을 위해 20 추가
        let height: CGFloat = collectionView.bounds.height
        
        return CGSize(width: cellWidth, height: height)
    }
    
}

// MARK: UICollectionView DataSource Implementation

extension StyleHashTagView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hashTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StyleHashTagCollectionViewCell", for: indexPath)
                as? StyleHashTagCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.styleHashTagButton.setTitle(hashTags[indexPath.row], for: .normal)
        return cell
    }
    
}

// MARK: Configure UI
extension StyleHashTagView {

    private func configureSubview() {
        [hashTagCollectionView].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        hashTagCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
}
