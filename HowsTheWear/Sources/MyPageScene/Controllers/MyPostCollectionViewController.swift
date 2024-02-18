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
        
        let post = postImageArray[indexPath.item]
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MyPagePostCollectionViewCell.reuseIdentifier,
            for: indexPath
        )
                as? MyPagePostCollectionViewCell else {
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

// MARK: 프리뷰
import SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return     UINavigationController(rootViewController: MyPostCollectionViewController())
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
        typealias  UIViewControllerType = UIViewController
    }
}
