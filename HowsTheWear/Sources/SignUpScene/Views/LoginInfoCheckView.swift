//
//  LoginInfoCheckView.swift
//  HowsTheWear
//
//  Created by 성대훈 on 2/7/24.
//

import UIKit

import SnapKit
import Then

class LoginInfoCheckView: UIView {
    private lazy var loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인 정보"
        label.textColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    // id 입력 부분
    private lazy var idView = UIStackView(arrangedSubviews: [idLabel,idTextField]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 10
    }
    
    
    // id 아이디 텍스트 표시
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        return label
    }()
    
    // id를 영어로 입력하는 부분
    let idTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.placeholder = "아이디를 입력해주세요."
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clipsToBounds = true
        textField.textColor = UIColor.black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var separatorView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    private lazy var pwView = UIStackView(arrangedSubviews: [pwLabel,pwTextField,passwordSecureButton]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 10
    }
    
    
    // id 아이디 텍스트 표시
    private let pwLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        return label
    }()
    
    // id를 영어로 입력하는 부분
    let pwTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.placeholder = "대소문자 포함 8자리."
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clipsToBounds = true
        textField.textColor = UIColor.black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
    
        return textField
    }()
    
    
    lazy var passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    private lazy var separatorView2 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    private lazy var pwConfirmView = UIStackView(arrangedSubviews: [pwConfirmLabel,pwConfirmTextField,passwordSecureButton]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 10
    }
    
    private let pwConfirmLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 확인"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        return label
    }()
    
    // 비밀번호 확인 부분의 텍스트 필드
    let pwConfirmTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.placeholder = "비밀번호를 입력해주세요."
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clipsToBounds = true
        textField.textColor = UIColor.black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var passwordSecureButton2: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.addTarget(self, action: #selector(passwordConfirmSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    private lazy var confirmButtonView: UIView = {
        let view = UIView()
        view.addSubview(nextButton);
        return view
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("다음으로", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.gray, for: .normal)
        return button
    }()
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
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
        addSubviews(loginTitleLabel,idView,separatorView,pwView,passwordSecureButton,separatorView2,pwConfirmView,passwordSecureButton2,nextButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        loginTitleLabel.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        loginTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(12)
            $0.left.equalTo(20)
        }
        
        idLabel.snp.makeConstraints {
            $0.width.equalTo(80)
        }
        
        pwLabel.snp.makeConstraints {
            $0.width.equalTo(idLabel.snp.width)
        }
        
        idView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginTitleLabel.snp.bottom).offset(24)
            $0.left.equalTo(loginTitleLabel)
            $0.height.equalTo(50)
        }
        
        separatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idView.snp.bottom).offset(16)
            $0.left.equalTo(idView.snp.left)
            $0.height.equalTo(1)
        }
        
        pwView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(separatorView.snp.bottom).offset(16)
            $0.left.equalTo(separatorView)
            $0.height.equalTo(idView.snp.height)
        }
        
        passwordSecureButton.snp.makeConstraints {
            $0.top.equalTo(pwView.snp.top).offset(10)
            $0.bottom.equalTo(pwTextField.snp.bottom).offset(10)
            $0.trailing.equalTo(pwTextField.snp.trailing).offset(1)
        }
        
        separatorView2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwView.snp.bottom).offset(16)
            $0.left.equalTo(pwView.snp.left)
            $0.height.equalTo(1)
        }
        
        pwConfirmView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(separatorView2.snp.bottom).offset(16)
            $0.left.equalTo(separatorView2)
            $0.height.equalTo(pwView.snp.height)
        }
        
        passwordSecureButton2.snp.makeConstraints {
            $0.top.equalTo(pwConfirmView.snp.top).offset(10)
            $0.bottom.equalTo(pwConfirmTextField.snp.bottom).offset(10)
            $0.trailing.equalTo(pwConfirmTextField.snp.trailing).offset(1)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwConfirmView.snp.bottom).offset(300)
            $0.left.equalTo(separatorView)
            $0.height.equalTo(60)
        }
    }
    
    @objc private func passwordSecureModeSetting() {
        pwTextField.isSecureTextEntry.toggle()
        
    }
    
    @objc private func passwordConfirmSecureModeSetting() {
        pwConfirmTextField.isSecureTextEntry.toggle()
        
    }
}

