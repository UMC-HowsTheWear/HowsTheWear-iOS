//
//  BrowseNextWeekViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/4/24.
//

import UIKit

final class BrowseNextWeekViewController: UIViewController {
    
    private let nextWeekHashTagView = StyleHashTagView()

    private lazy var nextWeekCollectionView = BrowseStyleCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        configureCollectionView()
        configureSubViews()
        configureLayout()
    }
    
}

// MARK: Configure InitialSetting

extension BrowseNextWeekViewController {
    
    private func configureInitialSetting() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        navigationItem.title = "저번주 코디"
    }
    
}

// MARK: - Configure CollectionView

extension BrowseNextWeekViewController {
    
    private func configureCollectionView() {
        // 모델, 데이터매니저 구현 후 데이터 받아오는 메서드 작성예정
        nextWeekCollectionView.configureContents([UIImage(named: "ThisWeekTestImage"),
                           UIImage(named: "ThisWeekTestImage"),
                           UIImage(named: "ThisWeekTestImage")])
    }
    
}

// MARK: - Configure UI

extension BrowseNextWeekViewController {
    
    private func configureSubViews() {
        [nextWeekHashTagView, nextWeekCollectionView].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        nextWeekHashTagView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(20)
            make.leading.equalTo(safeArea.snp.leading).offset(20)
            make.trailing.equalTo(safeArea.snp.trailing)
            make.height.equalTo(30)
        }
        
        nextWeekCollectionView.snp.makeConstraints { make in
            make.top.equalTo(nextWeekHashTagView.snp.bottom).offset(24)
            make.bottom.equalTo(safeArea.snp.bottom).offset(13)
            make.leading.equalTo(safeArea.snp.leading).offset(20)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-20)
        }
    }
    
}

