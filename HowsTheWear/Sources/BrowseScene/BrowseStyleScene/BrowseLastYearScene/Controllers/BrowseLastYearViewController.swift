//
//  BrowseLastYearViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/4/24.
//

import UIKit

final class BrowseLastYearViewController: UIViewController {

    private let browseStyleDataManager = BrowseStyleDataManager()
    
    private let lastYearStyleView = BrowseStyleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        configureCollectionView()
        configureSubViews()
        configureLayout()
    }
    
}

// MARK: Configure InitialSetting

extension BrowseLastYearViewController {
    
    private func configureInitialSetting() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        let backBarButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.title = "작년 이맘때는"
        navigationItem.backBarButtonItem = backBarButton
    }
    
}

// MARK: - Configure CollectionView

extension BrowseLastYearViewController {
    
    private func configureCollectionView() {
        lastYearStyleView.setCollectionViewCellSelectionHandler { [weak self] indexPath in
            let detailViewController = BrowseDetailViewController()
            self?.navigationController?.pushViewController(detailViewController, animated: true)
        }
        
        lastYearStyleView.configureContents(browseStyleDataManager.fetchLastYearImagesData())
    }
    
}

// MARK: - Configure UI

extension BrowseLastYearViewController {
    
    private func configureSubViews() {
        [lastYearStyleView].forEach { view.addSubview($0) }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        lastYearStyleView.snp.makeConstraints { make in
            make.top.equalTo(safeArea).inset(20)
            make.leading.equalTo(safeArea).inset(20)
            make.trailing.equalTo(safeArea).inset(20)
            make.bottom.equalTo(safeArea).inset(10)
        }
    }
    
}

