//
//  BrowseLastYearViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/4/24.
//

import UIKit

final class BrowseLastYearViewController: UIViewController {

    
    private let lastYearHashTagView = StyleHashTagView()

    private lazy var lastYearCollectionView = BrowseStyleCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureSubViews()
        configureLayout()
    }
    
}

// MARK: - Configure CollectionView

extension BrowseLastYearViewController {
    
    private func configureCollectionView() {
        // 모델, 데이터매니저 구현 후 데이터 받아오는 메서드 작성예정
        lastYearCollectionView.configureContents([UIImage(named: "ThisWeekTestImage"),
                           UIImage(named: "ThisWeekTestImage"),
                           UIImage(named: "ThisWeekTestImage")])
    }
    
}

// MARK: - Configure UI

extension BrowseLastYearViewController {
    
    private func configureSubViews() {
        [lastYearHashTagView, lastYearCollectionView].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        lastYearHashTagView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top)
            make.leading.equalTo(safeArea.snp.leading).offset(20)
            make.trailing.equalTo(safeArea.snp.trailing)
            make.height.equalTo(30)
        }
        
        lastYearCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(50)
            make.bottom.equalTo(safeArea.snp.bottom).offset(13)
            make.leading.equalTo(safeArea.snp.leading).offset(20)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-20)
        }
    }
    
}

