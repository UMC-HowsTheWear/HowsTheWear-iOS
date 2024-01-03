//
//  WeatherBarButtonItem.swift
//  HowsTheWear
//
//  Created by Rafael on 1/3/24.
//

import UIKit

import SnapKit
import Then

class WeatherBarButtonItem: UIView {

    let menuButton = UIButton().then {
        $0.setImage(UIImage(named: "menu"), for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNavigationBarButtonSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigationBarButtonSize() {
        menuButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
    }

}
