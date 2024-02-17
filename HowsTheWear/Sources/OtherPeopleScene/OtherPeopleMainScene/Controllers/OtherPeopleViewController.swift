//
//  OtherPeopleViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/7/24.
//

import UIKit

final class OtherPeopleViewController: UIViewController {
    
    private let otherPeopleImageArray: [[UIImage]] = [[]]
    
    private let otherPeopleView = OtherPeopleView()
    
    override func loadView() {
        view = otherPeopleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        configureCollectionView()
        configureAction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController?.tabBar.isHidden = false
        otherPeopleView.myPostButton.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let navigationController = navigationController,
           navigationController.topViewController is MyPostViewController
        {
            otherPeopleView.myPostButton.isHidden = true
            tabBarController?.tabBar.isHidden = true
        }
    }

}

// MARK: Configure InitialSetting

extension OtherPeopleViewController {
    
    private func configureInitialSetting() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        configureNaviBar()
    }
    
    private func configureNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        appearance.titleTextAttributes = [
            .font: UIFont.pretendard(size: 16, weight: .semibold),
            .foregroundColor: UIColor.black
        ]
    
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black

        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        let backBarButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.title = "다른사람들은"
        navigationItem.backBarButtonItem = backBarButton
    }
    
}

// MARK: - Configure CollectionView

extension OtherPeopleViewController {
    
    
    private func configureCollectionView() {
        otherPeopleView.othersPeopleCollectionView.delegate = self
        
        otherPeopleView.setCollectionViewCellSelectionHandler { [weak self] indexPath in
            let detailViewController = OtherPeopleDetailViewController()
            self?.navigationController?.pushViewController(detailViewController, animated: true)
            
//            // 모델, 데이터매니저 구현 후 데이터 받아오는 메서드 작성예정
        }
        
    }
}

// MARK: - Implement CollectionView Delegate

extension OtherPeopleViewController: UICollectionViewDelegate, browseCollectionReusableDelegate{
    func browseHeaderRightArrowButtonTapped(section: Int) {
            print(section)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath)
    }
}


// MARK: - Configure Action

extension OtherPeopleViewController {
    private func configureAction() {
        otherPeopleView.myPostButton.addTarget(self, action: #selector(myPostButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func myPostButtonDidTap() {
        let myPostVC = MyPostViewController()
        navigationController?.pushViewController(myPostVC, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
    
}
