//
//  BrowseNextWeekViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/4/24.
//

import UIKit

final class BrowseNextWeekViewController: UIViewController {
    
    private let nextWeekStyleView = BrowseStyleView()
    
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
        navigationItem.title = "다음주 코디"
    }
    
}

// MARK: - Configure CollectionView

extension BrowseNextWeekViewController {
    
    private func configureCollectionView() {
        // 모델, 데이터매니저 구현 후 데이터 받아오는 메서드 작성예정
        nextWeekStyleView.configureContents([UIImage(named: "ThisWeekTestImage"),
                           UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),
                                             UIImage(named: "ThisWeekTestImage"),

                           UIImage(named: "ThisWeekTestImage")]
        )
    }
    
}

// MARK: - Configure UI

extension BrowseNextWeekViewController {
    
    private func configureSubViews() {
        [nextWeekStyleView].forEach { view.addSubview($0) }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        nextWeekStyleView.snp.makeConstraints { make in
            make.top.equalTo(safeArea).inset(20)
            make.leading.equalTo(safeArea).inset(20)
            make.trailing.equalTo(safeArea).inset(20)
            make.bottom.equalTo(safeArea).inset(10)
        }
    }
    
}

