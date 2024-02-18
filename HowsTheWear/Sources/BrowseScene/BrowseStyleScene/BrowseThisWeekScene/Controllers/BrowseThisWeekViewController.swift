//
//  BrowseThisWeekViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/21/24.
//

import UIKit

final class BrowseThisWeekViewController: UIViewController {
    
    private var thisWeekStyleArray: [BrowseStyleDataModel] = []
    private let browseStyleDataManager = BrowseStyleDataManager()
    
    private let thisWeekStyleView = BrowseStyleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        configureCollectionView()
        configureSubViews()
        configureLayout()
    }
    
}

// MARK: Configure InitialSetting

extension BrowseThisWeekViewController {
    private func configureInitialSetting() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        
        let backBarButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.title = "이번주 코디"
        navigationItem.backBarButtonItem = backBarButton
    }
    
}

// MARK: - Configure CollectionView

extension BrowseThisWeekViewController {
    
    private func configureCollectionView() {
        
        thisWeekStyleView.setCollectionViewCellSelectionHandler { [weak self] indexPath in
            let detailViewController = BrowseDetailViewController()
            self?.navigationController?.pushViewController(detailViewController, animated: true)
        }
        
        thisWeekStyleView.configureContents(browseStyleDataManager.fetchThisWeekImagesData())
    }
    
}

// MARK: - Configure UI

extension BrowseThisWeekViewController {
    
    private func configureSubViews() {
        [thisWeekStyleView].forEach { view.addSubview($0) }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        thisWeekStyleView.snp.makeConstraints { make in
            make.top.equalTo(safeArea).inset(20)
            make.leading.equalTo(safeArea).inset(20)
            make.trailing.equalTo(safeArea).inset(20)
            make.bottom.equalTo(safeArea).inset(10)
        }
    }
    
}
