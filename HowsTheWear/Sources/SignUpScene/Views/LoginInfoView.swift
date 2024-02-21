//
//  LoginInfoView.swift
//  HowsTheWear
//
//  Created by 성대훈 on 2/6/24.
//

import UIKit

import SnapKit
import Then

class LoginInfoView: UIView,UITextFieldDelegate {
    
    private lazy var loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인"
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
        label.font = UIFont(name: "Pretendard-Medium", size: 16)
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
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
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
        label.font = UIFont(name: "Pretendard-Medium", size: 16)
        label.textColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        return label
    }()
    
    // id를 영어로 입력하는 부분
    let pwTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.placeholder = "비밀번호를 입력해주세요."
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
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
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .systemGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    private lazy var confirmButtonView: UIView = {
        let view = UIView()
        view.addSubview(confirmButton);
        return view
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("확인", for: .normal)
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
        addSubviews(loginTitleLabel,idView,separatorView,pwView,passwordSecureButton,confirmButton)
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
            $0.centerY.equalTo(pwTextField)
            $0.trailing.equalTo(pwView.snp.trailing).offset(-10)
        }
        
        confirmButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.equalTo(separatorView)
            $0.height.equalTo(60)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(7)
        }
        
    }
    
    @objc private func passwordSecureModeSetting() {
        passwordSecureButton.isSelected.toggle()
        let eyeImage = passwordSecureButton.isSelected ? "eye.slash" : "eye"
        passwordSecureButton.setImage(UIImage(systemName: eyeImage), for: .normal)
        pwTextField.isSecureTextEntry.toggle()
    }
}




