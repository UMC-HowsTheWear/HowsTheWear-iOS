//
//  OtherPeopleViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/7/24.
//

import UIKit

final class OtherPeopleViewController: UIViewController {
    
    private let browseMainDataManager = BrowseMainDataManager()
    
    private var dataArray:[[BrowseMainDataModel]] = []

    private let detailViewController = OtherPeopleDetailViewController()
    
    private let otherPeopleStyleViewController = OtherPeopleStyleViewController()

    private var hashTagNumber: Int = 5
    
    private var hashTagTitleArray: [String] = ["#캐쥬얼", "#스트릿", "#페미닌", "#미니멀", "#빈티지"]
    
    let othersPeopleCollectionView = BrowseMainCollectionView(isHiddenCellUserID: false, cellImageCorenerRadius: 8)
    
    let myPostButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setImage(UIImage(systemName: "plus")?
            .withConfiguration(
                UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)), for: .normal)
        $0.tintColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        view = otherPeopleView
        configureInitialSetting()
        configureCollectionView()
        configureAction()
        configureSubview()
        configureLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configurePlusButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNaviBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController?.tabBar.isHidden = false
        myPostButton.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let navigationController = navigationController,
           navigationController.topViewController is MyPostViewController
        {
            myPostButton.isHidden = true
            tabBarController?.tabBar.isHidden = true
        }
    }

}

// MARK: Configure InitialSetting

extension OtherPeopleViewController {
    
    private func configureInitialSetting() {
        view.backgroundColor =  colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        configureNaviBar()
        dataArray = [
            browseMainDataManager.fetchLastYearImagesData(),
            browseMainDataManager.fetchThisWeekImagesData(),
            browseMainDataManager.fetchNextWeekImagesData(),
            browseMainDataManager.fetchMinimalImageData(),
            browseMainDataManager.fetchVintageImagesData(),
        ]
    }
    
    private func configureNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor =  colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
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
    
    private func configurePlusButton() {
        myPostButton.layer.cornerRadius = myPostButton.frame.height / 2
        myPostButton.layer.shadowColor = UIColor.black.cgColor
        myPostButton.layer.shadowOpacity = 0.5
        myPostButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        myPostButton.layer.shadowRadius = 10
    }
    
}

// MARK: - Configure CollectionView

extension OtherPeopleViewController {
<<<<<<< HEAD
=======

    func setCollectionViewCellSelectionHandler(_ handler: @escaping ((IndexPath) -> Void)) {
        othersPeopleCollectionView.didSelectCell = handler
    }
>>>>>>> feat/totalEdit
    
    private func configureCollectionView() {
        othersPeopleCollectionView.delegate = self
        
        setCollectionViewCellSelectionHandler { [weak self] indexPath in
            guard let self = self else { return }
            detailViewController.otherPeopleDetailView.configureContents(
                self.dataArray[indexPath.section][indexPath.item].images,
                hashTag: hashTagTitleArray[indexPath.section]
            )
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
        
        othersPeopleCollectionView.configureContents(
            sectionCount: hashTagNumber,
            data: dataArray,
            sectionTitles: hashTagTitleArray
        )
    }
    
}

// MARK: - Implement CollectionView Delegate

extension OtherPeopleViewController: UICollectionViewDelegate, browseCollectionReusableDelegate{
    func browseHeaderRightArrowButtonTapped(section: Int) {
          
        otherPeopleStyleViewController.configureContents(naviBarTitle: hashTagTitleArray[section], data: dataArray[section])
        navigationController?.pushViewController(otherPeopleStyleViewController, animated: true)
        }
    
}


// MARK: - Configure Action

extension OtherPeopleViewController {
    private func configureAction() {
        myPostButton.addTarget(self, action: #selector(myPostButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func myPostButtonDidTap() {
        let myPostVC = MyPostViewController()
        navigationController?.pushViewController(myPostVC, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
    
}


// MARK: - Configure UI

extension OtherPeopleViewController {
    private func configureSubview() {
        [othersPeopleCollectionView, myPostButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        othersPeopleCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).inset(30)
            make.bottom.equalTo(safeArea.snp.bottom)
            make.leading.equalTo(safeArea.snp.leading).inset(20)
            make.trailing.equalTo(safeArea.snp.trailing)
        }
        
        myPostButton.snp.makeConstraints {
            $0.right.equalTo(-15)
            $0.bottom.equalTo(safeArea.snp.bottom).inset(15)
            $0.width.height.equalTo(55)
        }
    }
    
}
