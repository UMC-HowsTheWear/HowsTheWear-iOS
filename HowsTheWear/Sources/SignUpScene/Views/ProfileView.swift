//
//  ProfileView.swift
//  HowsTheWear
//
//  Created by 성대훈 on 2/12/24.
//

import UIKit

import SnapKit
import Then

class ProfileView: UIView {
    private lazy var ProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "회원 정보"
        label.textColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    // id 입력 부분
    private lazy var nameView = UIStackView(arrangedSubviews: [nameLabel,nameTextField]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 30
    }
    
    
    // id 아이디 텍스트 표시
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        return label
    }()
    
    // id를 영어로 입력하는 부분
    let nameTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.placeholder = "이름 입력해주세요."
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
    
    private lazy var ageView = UIStackView(arrangedSubviews: [ageLabel,ageField]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 30
    }
    
    // id 아이디 텍스트 표시
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "나이"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        return label
    }()
    
    // 나이 토글로 바꿔
    let ageField: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitle("나이대를 선택하려면 꾹 누르세요.", for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.clipsToBounds = true
        button.setTitleColor(UIColor.lightGray, for: .normal)
        
        let teen = UIAction(title:"10대",handler: { _ in print("10대") })
        let twenties = UIAction(title:"20대",handler: { _ in print("20대") })
        let thirties = UIAction(title:"30대",handler: { _ in print("30대") })
        button.menu = UIMenu(title: "나이대",
                             identifier: nil,
                             options: .displayInline,
                             children: [ teen, twenties, thirties ])

        return button
    }()
    
    private lazy var separatorView2 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    private lazy var selectGenderView = UIStackView(arrangedSubviews: [selectGenderLabel,selectGenderField]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 10
    }
    
    private let selectGenderLabel: UILabel = {
        let label = UILabel()
        label.text = "성별"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = #colorLiteral(red: 0.1333333254, green: 0.1333332956, blue: 0.1333333254, alpha: 1)
        return label
    }()
    
    private lazy var selectGenderField = UIStackView(arrangedSubviews: [selectGenderMan,selectGenderWoman]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 0
    }
    
    // 남자 여자 버튼 선택
    let selectGenderMan: UIButton = {
        let button = UIButton()
        button.setTitle("남자", for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    let selectGenderWoman: UIButton = {
        let button = UIButton()
        button.setTitle("여자", for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.clipsToBounds = true
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
        addSubviews(ProfileLabel,nameView,separatorView,ageView,separatorView2,selectGenderView,nextButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        ProfileLabel.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        ProfileLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(12)
            $0.left.equalTo(20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.width.equalTo(80)
        }
        
        ageLabel.snp.makeConstraints {
            $0.width.equalTo(nameLabel.snp.width)
        }
        
        nameView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ProfileLabel.snp.bottom).offset(24)
            $0.left.equalTo(ProfileLabel)
            $0.height.equalTo(50)
        }
        
        separatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nameView.snp.bottom).offset(16)
            $0.left.equalTo(nameView.snp.left)
            $0.height.equalTo(1)
        }
        
        ageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(separatorView.snp.bottom).offset(16)
            $0.left.equalTo(separatorView)
            $0.height.equalTo(nameView.snp.height)
        }
        
        separatorView2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ageView.snp.bottom).offset(16)
            $0.left.equalTo(ageView.snp.left)
            $0.height.equalTo(1)
        }
        
        selectGenderView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(separatorView2.snp.bottom).offset(16)
            $0.left.equalTo(ProfileLabel.snp.left)
            $0.height.equalTo(ageView.snp.height)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(selectGenderView.snp.bottom).offset(300)
            $0.left.equalTo(separatorView)
            $0.height.equalTo(60)
        }
    }
    
}

