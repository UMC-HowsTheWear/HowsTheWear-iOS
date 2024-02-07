//
//  OthersView.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import UIKit

import SnapKit
import Then

final class OthersView: UIView {

    let myPostButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setImage(UIImage(systemName: "plus")?
            .withConfiguration(
                UIImage.SymbolConfiguration(
                    pointSize: 30, weight: .regular
                )
            ), for: .normal
        )
        $0.tintColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myPostButton.layer.cornerRadius = myPostButton.frame.height / 2
        myPostButton.layer.shadowColor = UIColor.black.cgColor
        myPostButton.layer.shadowOpacity = 0.5
        myPostButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        myPostButton.layer.shadowRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(myPostButton)
        
        myPostButton.snp.makeConstraints {
            $0.right.equalTo(-15)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(15)
            $0.width.height.equalTo(55)
        }
    }

}
