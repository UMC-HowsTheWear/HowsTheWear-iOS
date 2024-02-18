//
//  SavedPostCollectionViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/18/24.
//

import UIKit

final class SavedPostCollectionViewController: UIViewController {

    private lazy var postImageCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    private var postImageArray = [UIImage(named: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserPostCollectionView()
        configureSubview()
        configureLayout()
    }
    
}

// MARK: - Implement ProfileViewController DataSource

extension SavedPostCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let post = postImageArray[indexPath.item]
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MyPagePostCollectionViewCell.reuseIdentifier,
            for: indexPath
        )
                as? MyPagePostCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.postImageView.image = postImageArray[indexPath.item]
        
        return cell
    }
    
}
      
// MARK: - Configure CollectionView
extension SavedPostCollectionViewController {
    private func configureUserPostCollectionView() {
        postImageCollectionView.dataSource = self
        
        postImageCollectionView.register(
            MyPagePostCollectionViewCell.self,
            forCellWithReuseIdentifier: MyPagePostCollectionViewCell.reuseIdentifier
        )
        postImageCollectionView.backgroundColor = .clear
    }
    
    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/2),
            heightDimension: .fractionalHeight(1/2)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}
  
// MARK: - Configure UI

extension SavedPostCollectionViewController {
    private func configureSubview() {
        view.addSubview(postImageCollectionView)
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        postImageCollectionView.snp.makeConstraints { make in
            make.margins.equalToSuperview()
        }
    }
    
}

