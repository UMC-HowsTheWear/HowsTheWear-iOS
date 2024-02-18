//
//  MyPostCollectionViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/17/24.
//

import UIKit

final class MyPostCollectionViewController: UIViewController {
    
    private lazy var postImageCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    private var postImageArray: [MyPostImagesDataModel] = []
    private let myPostImagesDataManager = MyPostImagesDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserPostCollectionView()
        configureSubview()
        configureLayout()
    }
    
}

  // MARK: Implement ProfileViewController DataSource
extension MyPostCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        _ = postImageArray[indexPath.item]
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MyPagePostCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? MyPagePostCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.postImageView.image = postImageArray[indexPath.item].postImages
        
        return cell
    }
}
      
  // MARK: Configure CollectionView

extension MyPostCollectionViewController {
    private func configureUserPostCollectionView() {
        postImageCollectionView.dataSource = self
        
        postImageCollectionView.register(
            MyPagePostCollectionViewCell.self,
            forCellWithReuseIdentifier: MyPagePostCollectionViewCell.reuseIdentifier
        )
        postImageCollectionView.backgroundColor = .clear
        
        postImageArray = myPostImagesDataManager.fetchMyPostImagesData()
    }
    
    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/2),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 1.5, bottom: 0, trailing: 1.5)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.92)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}
  
  // MARK: Configure UI

extension MyPostCollectionViewController {
    private func configureSubview() {
        view.addSubview(postImageCollectionView)
    }
    
    private func configureLayout() {
        
        postImageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
