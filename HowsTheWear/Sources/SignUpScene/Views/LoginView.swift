//
//  LoginView.swift
//  HowsTheWear
//
//  Created by 성대훈 on 2/6/24.
//

import UIKit

import SnapKit
import Then

class LoginView: UIView {

    lazy var loginButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setTitle("로그인하기", for: .normal)
//        $0.font = .pretendard(size: 24, weight: .semibold)
        $0.titleLabel?.textColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 13
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        
        addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(52)
            $0.left.equalTo(20)
            
        }
        
    }
    
}
