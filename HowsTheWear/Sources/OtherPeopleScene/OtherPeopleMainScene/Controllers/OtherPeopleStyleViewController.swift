//
//  OtherPeopleStyleViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/21/24.
//

import UIKit

final class OtherPeopleStyleViewController: UIViewController {
    
    private let otherPeopleDetailViewController = OtherPeopleDetailViewController()
    
    private var naviBarTitle: String = ""
    
    private var imageArray: [BrowseMainDataModel] = [] {
        didSet {
            otherPeopleStyleCollectionView.reloadData()
        }
    }
    
    private lazy var otherPeopleStyleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: generateCollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        configureCollectionView()
        configureSubview()
        configureLayout()
    }
    
}

// MARK: Configure InitialSetting

extension OtherPeopleStyleViewController {
    private func configureInitialSetting() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        
        let backBarButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.title = "\(naviBarTitle)"
        navigationItem.backBarButtonItem = backBarButton
    }
    
}

// MARK: - Configure UICollectionView
extension OtherPeopleStyleViewController {
    private func configureCollectionView() {
        otherPeopleStyleCollectionView.dataSource = self
        otherPeopleStyleCollectionView.delegate = self
        
        otherPeopleStyleCollectionView.register(BrowseCollectionViewCell.self, forCellWithReuseIdentifier: BrowseCollectionViewCell.reuseIdentifier)
        
        otherPeopleStyleCollectionView.backgroundColor = .clear
    }
    
    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/2),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 15.74, trailing: 6)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.31)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}

// MARK: - Implement CollectionView DataSource

extension OtherPeopleStyleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BrowseCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? BrowseCollectionViewCell else { return UICollectionViewCell() }
        
        cell.styleImageView.image = imageArray[indexPath.item].images
        cell.styleImageView.layer.cornerRadius = 8
        cell.configureCellContents(isHiddenUserIDLabel: false)
        
        return cell
    }
    
}

// MARK: - Implement CollectionView Delegate

extension OtherPeopleStyleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        otherPeopleDetailViewController.otherPeopleDetailView.configureContents(imageArray[indexPath.item].images, hashTag: naviBarTitle)
        navigationController?.pushViewController(otherPeopleDetailViewController, animated: true)
    }
}

// MARK: - Public Interface

extension OtherPeopleStyleViewController {
    func configureContents(naviBarTitle: String, data: [BrowseMainDataModel]) {
        imageArray = data
        self.naviBarTitle = naviBarTitle
    }
}

// MARK: - Configure UI
extension OtherPeopleStyleViewController {
    private func configureSubview() {
        view.addSubview(otherPeopleStyleCollectionView)
    }
    
    private func configureLayout() {
        otherPeopleStyleCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(13)
        }
    }
    
}
