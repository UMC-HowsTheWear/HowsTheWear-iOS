//
//  BrowseDetailViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 1/26/24.
//

import UIKit

final class BrowseDetailViewController: UIViewController {
    
    let browseDetailView = BrowseDetailView()
    
    var dataArray: [UIImage?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        configureSubview()
        configureLayout()
    }

}

// MARK: - Configure InitialSetting

extension BrowseDetailViewController {
    private func configureInitialSetting() {
        fetchData()
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    }
    
    func fetchData() {
        browseDetailView.browseDetailCellPagingImageView.configureContents(dataArray)
    }
    
}

// MARK: - Configure UI

extension BrowseDetailViewController {
    private func configureSubview() {
        view.addSubview(browseDetailView)
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        browseDetailView.snp.makeConstraints { make in
            make.centerX.equalTo(safeArea)
            make.top.equalTo(safeArea).inset(20)
            make.leading.equalTo(safeArea).inset(16)
            make.bottom.equalTo(safeArea).inset(25)
        }
    }
    
}
