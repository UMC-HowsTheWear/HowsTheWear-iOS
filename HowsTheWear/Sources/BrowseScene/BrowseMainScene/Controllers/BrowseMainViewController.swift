//
//  BrowseViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/2/24.
//

import UIKit

import SnapKit

final class BrowseMainViewController: UIViewController {

    private let browseMainDataManager = BrowseMainDataManager()
    
    private var dataArray:[[BrowseMainDataModel]] = []
    
    private let browseDetailView = BrowseDetailView()
    
    private let browseDetailViewController = BrowseDetailViewController()
    
    private lazy var browseMainCollectionView = BrowseMainCollectionView(isHiddenCellUserID: true, cellImageCorenerRadius: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        configureCollectionView()
        configureSubViews()
        configureLayout()
    }
    
}

// MARK: Configure InitialSetting

extension BrowseMainViewController {
    
    private func configureInitialSetting() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        configureNaviBar()
        dataArray = [
            browseMainDataManager.fetchThisWeekImagesData(),
            browseMainDataManager.fetchNextWeekImagesData(),
            browseMainDataManager.fetchLastYearImagesData()
        ]
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
        
        navigationItem.title = "둘러보기"
        navigationItem.backBarButtonItem = backBarButton
    }
    
}

// MARK: - Configure CollectionView

extension BrowseMainViewController {
    
    func setCollectionViewCellSelectionHandler(_ handler: @escaping ((IndexPath) -> Void)) {
        browseMainCollectionView.didSelectCell = handler
    }
    
    private func configureCollectionView() {
        browseMainCollectionView.delegate = self
        
            setCollectionViewCellSelectionHandler { [weak self] indexPath in
                guard let self = self else { return }
                browseDetailViewController.dataArray = self.dataArray
            let detailViewController = BrowseDetailViewController()
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
        browseMainCollectionView.configureContents(
            sectionCount: 3,
            data: dataArray,
            sectionTitles: ["이번주 코디", "저번주 코디", "작년 이맘때는"]
        )
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
            make.leading.equalTo(safeArea.snp.leading).inset(20)
            make.trailing.equalTo(safeArea.snp.trailing)
        }
    }
    
}
