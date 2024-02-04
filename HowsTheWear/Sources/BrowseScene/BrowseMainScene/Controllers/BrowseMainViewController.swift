//
//  BrowseViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/2/24.
//

import UIKit

import SnapKit

final class BrowseMainViewController: UIViewController {
    
    private var thisWeekStyleArray:[UIImage?] = [
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage")
    ]
    
    private var nextWeekStyleArray:[UIImage?] = [
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage")
    ]
    
    private var lastYearStyleArray:[UIImage?] = [
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage"),
        UIImage(named: "StyleTestImage")
    ]

    private lazy var browseMainCollectionView = BrowseMainCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        browseMainCollectionView.configureContents(3, [thisWeekStyleArray, nextWeekStyleArray, lastYearStyleArray])
        configureCollectionView()
        configureSubViews()
        configureLayout()
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    }
    
}

// MARK: Configure InitialSetting

extension BrowseMainViewController {
    private func configureInitialSetting() {
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
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        navigationItem.title = "둘러보기"
    }
    
}

// MARK: - Configure CollectionView

extension BrowseMainViewController {
    
    private func configureCollectionView() {
        browseMainCollectionView.delegate = self
        // 모델, 데이터매니저 구현 후 데이터 받아오는 메서드 작성예정
    }

    
}

// MARK: - Implement browseCollectionReusableDelegate
extension BrowseMainViewController: browseCollectionReusableDelegate{
    func browseHeaderRightArrowButtonTapped(section: Int) {
        switch section {
        case 0:
            let browseThisWeekViewController = BrowseThisWeekViewController()
            navigationController?.pushViewController(browseThisWeekViewController, animated: true)
        case 1:
            let browseNextWeekViewController = BrowseNextWeekViewController()
            navigationController?.pushViewController(browseNextWeekViewController, animated: true)
        case 2:
            let browseLastYearViewController = BrowseLastYearViewController()
            navigationController?.pushViewController(browseLastYearViewController, animated: true)
        default:
            break
        }
    }
    
}

// MARK: - Configure UI

extension BrowseMainViewController {
    
    private func configureSubViews() {
        [browseMainCollectionView].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        browseMainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).inset(30)
            make.bottom.equalTo(safeArea.snp.bottom)
            make.leading.equalTo(safeArea.snp.leading).inset(15)
            make.trailing.equalTo(safeArea.snp.trailing)
        }
    }
    
}
