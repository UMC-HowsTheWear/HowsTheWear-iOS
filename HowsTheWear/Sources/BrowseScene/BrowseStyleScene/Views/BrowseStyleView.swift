//
//  BrowseStyleView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/4/24.
//

import UIKit

final class BrowseStyleView: UIView {
    
    private let styleHashTagView = StyleHashTagView()

    private lazy var browseStyleCollectionView = BrowseStyleCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureInitialSetting()
        configureSubViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Configure InitialSetting

extension BrowseStyleView {
    
    private func configureInitialSetting() {
        backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    }
    
}

// MARK: - Public Interface

extension BrowseStyleView {
    
    func setCollectionViewCellSelectionHandler(_ handler: @escaping ((IndexPath) -> Void)) {
        browseStyleCollectionView.didSelectCell = handler
    }
    
    func configureContents(_ images: [UIImage?]) {
        browseStyleCollectionView.configureContents(images)
    }
}

// MARK: - Configure UI

extension BrowseStyleView {
    
    private func configureSubViews() {
        [styleHashTagView, browseStyleCollectionView].forEach {
            addSubview($0)
        }
    }
    
    private func configureLayout() {
        styleHashTagView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(20)
            make.height.equalTo(30)
        }
        
        browseStyleCollectionView.snp.makeConstraints { make in
            make.top.equalTo(styleHashTagView.snp.bottom).offset(24)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
        }
    }
    
}

