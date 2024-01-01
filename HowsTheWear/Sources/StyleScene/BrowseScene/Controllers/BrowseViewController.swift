//
//  BrowseViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/2/24.
//

import UIKit
import SnapKit

class BrowseViewController: UIViewController {

    private let browseCollectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureLayout()
    }
}

// MARK: - Configure UI

extension BrowseViewController {
    
    private func configureSubViews() {
        [browseCollectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        browseCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(30)
            make.bottom.equalTo(safeArea.snp.bottom)
            make.leading.equalTo(safeArea.snp.leading).offset(15)
            make.trailing.equalTo(safeArea.snp.trailing).offset(15)
        }
    }
}
