//
//  OtherPeopleView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/7/24.
//

import UIKit

final class OtherPeopleView: UIView {
    
    private var hashTagNumber: Int = 5
    
    private var hashTagTitleArray: [String] = ["#캐쥬얼", "#스트릿", "#페미닌", "#미니멀"]
  
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
    
    private let othersPeopleCollectionView = BrowseMainCollectionView(isHiddenCellUserID: false)
    
    let myPostButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setImage(UIImage(systemName: "plus")?
            .withConfiguration(
                UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)), for: .normal)
        $0.tintColor = .white
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureInitialSetting()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fetchData()
        configureInitialSetting()
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configure InitialSetting

extension OtherPeopleView {
    private func configureInitialSetting() {
        myPostButton.layer.cornerRadius = myPostButton.frame.height / 2
        myPostButton.layer.shadowColor = UIColor.black.cgColor
        myPostButton.layer.shadowOpacity = 0.5
        myPostButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        myPostButton.layer.shadowRadius = 10
    }
    
}

// MARK: - SetUp Data

extension OtherPeopleView {
    private func fetchData() {
        othersPeopleCollectionView.configureContents(
            sectionCount: hashTagNumber,
            imagesData: [thisWeekStyleArray, nextWeekStyleArray, lastYearStyleArray, thisWeekStyleArray, nextWeekStyleArray],
            sectionTitles: hashTagTitleArray
        )
    }
}

// MARK: - Configure UI

extension OtherPeopleView {
    private func configureSubview() {
        [othersPeopleCollectionView, myPostButton].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        othersPeopleCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(30)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
        }
        
        myPostButton.snp.makeConstraints {
            $0.right.equalTo(-15)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(15)
            $0.width.height.equalTo(55)
        }
    }
    
}
