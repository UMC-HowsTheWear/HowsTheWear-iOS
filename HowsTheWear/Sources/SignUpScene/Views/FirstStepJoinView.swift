//
//  FirstStepJoinView.swift
//  HowsTheWear
//
//  Created by RAFA on 2/21/24.
//

import UIKit

import SnapKit
import Then

final class FirstStepJoinView: UIView {
    
    private let titleWidth = 100.0
    
    private let titleLabel = UILabel().then {
        $0.text = "로그인 정보"
        $0.font = .pretendard(size: 20, weight: .semibold)
        $0.textColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1)
    }
    
    private let idLabel = UILabel().then {
        $0.text = "아이디"
        $0.font = .pretendard(size: 15, weight: .medium)
        $0.textColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
    }
    
    let idTextField = UITextField().then {
        $0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        $0.placeholder = "아이디를 입력해주세요"
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        $0.clipsToBounds = true
        $0.textColor = UIColor.black
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
    }
    
    private lazy var idView = UIStackView(arrangedSubviews: [idLabel,idTextField]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
    }
    
    let doubleCheckButton = UIButton().then {
        $0.backgroundColor = #colorLiteral(red: 0.4442995787, green: 0.6070379615, blue: 0.9031649232, alpha: 1)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.setAttributedTitle(
            NSAttributedString(
                string: "중복확인",
                attributes: [
                    .font: UIFont.pretendard(size: 13, weight: .medium),
                    .foregroundColor: UIColor.white
                ]
            ), for: .normal
        )
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    private let separatorView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    private let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = .pretendard(size: 15, weight: .medium)
        $0.textColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
    }
    
    let pwTextField = UITextField().then {
        $0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        $0.placeholder = "대소문자 포함 8자리"
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        $0.clipsToBounds = true
        $0.textColor = UIColor.black
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.isSecureTextEntry = true
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
    }
    
    private lazy var pwView = UIStackView(arrangedSubviews: [pwLabel,pwTextField]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
    }
    
    private let pwEyeIcon = UIButton().then {
        $0.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        $0.tintColor = #colorLiteral(red: 0.5141947269, green: 0.5141947269, blue: 0.5141947269, alpha: 1)
    }
    
    private let secondSeparatorView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    private let pwCheckLabel = UILabel().then {
        $0.text = "비밀번호 확인"
        $0.font = .pretendard(size: 15, weight: .medium)
        $0.textColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
    }

    let pwCheckTextField = UITextField().then {
        $0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .pretendard(size: 13, weight: .regular)
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        $0.clipsToBounds = true
        $0.textColor = UIColor.black
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.isSecureTextEntry = true
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
    }
    
    private lazy var pwCheckView = UIStackView(arrangedSubviews: [pwCheckLabel,pwCheckTextField]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
    }
    
    private let pwCheckEyeIcon = UIButton().then {
        $0.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        $0.tintColor = #colorLiteral(red: 0.5141947269, green: 0.5141947269, blue: 0.5141947269, alpha: 1)
    }
    
    let nextButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setAttributedTitle(
            NSAttributedString(
                string: "다음으로",
                attributes: [
                    .font: UIFont.pretendard(size: 14, weight: .medium),
                    .foregroundColor: UIColor.white
                ]
            ), for: .normal
        )
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
        backgroundColor = #colorLiteral(red: 0.980392158, green: 0.980392158, blue: 0.980392158, alpha: 1)
        addSubviews([
            titleLabel,
            idView, doubleCheckButton,
            separatorView,
            pwView, pwEyeIcon,
            secondSeparatorView,
            pwCheckView,pwCheckEyeIcon,
            nextButton
        ])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            $0.left.equalTo(20)
        }
        
        idLabel.snp.makeConstraints {
            $0.width.equalTo(titleWidth)
        }
        
        idTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        idView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.left.equalTo(titleLabel)
        }
        
        doubleCheckButton.snp.makeConstraints {
            $0.centerY.equalTo(idView)
            $0.top.equalTo(idView.snp.top).inset(10)
            $0.right.equalTo(idView.snp.right).inset(10)
        }
        
        separatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idView.snp.bottom).offset(16)
            $0.left.equalTo(idView)
            $0.height.equalTo(1)
        }
        
        pwLabel.snp.makeConstraints {
            $0.width.equalTo(titleWidth)
        }
        
        pwTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        pwView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(separatorView.snp.bottom).offset(16)
            $0.left.equalTo(separatorView)
        }
        
        pwEyeIcon.snp.makeConstraints {
            $0.centerY.equalTo(pwView)
            $0.top.equalTo(pwView.snp.top).inset(10)
            $0.right.equalTo(pwView.snp.right).inset(10)
        }
        
        secondSeparatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwView.snp.bottom).offset(16)
            $0.left.equalTo(pwView)
            $0.height.equalTo(1)
        }
        
        pwCheckLabel.snp.makeConstraints {
            $0.width.equalTo(titleWidth)
        }
        
        pwCheckTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        pwCheckView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(secondSeparatorView.snp.bottom).offset(16)
            $0.left.equalTo(secondSeparatorView)
        }
        
        pwCheckEyeIcon.snp.makeConstraints {
            $0.centerY.equalTo(pwCheckView)
            $0.top.equalTo(pwCheckView.snp.top).inset(10)
            $0.right.equalTo(pwCheckView.snp.right).inset(10)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.equalTo(titleLabel)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(10)
            $0.height.equalTo(50)
        }
    }
    
}
