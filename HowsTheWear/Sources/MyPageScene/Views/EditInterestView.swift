//
//  EditInterestView.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/21/24.
//

import UIKit

final class EditInterestView: UIView {
    
    var hashTagArray:[String] = []
    var heatNumber:Float = 0.0
    var coldNumber:Float = 0.0
    
    private let myPageViewController = MyPageViewController()
    
    private let dividerView1 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    private let dividerView2 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    private let dividerView3 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    private let dividerView4 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "주로 입는 패션스타일을 알려주세요"
        $0.textColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1)
        $0.font = UIFont.pretendard(size: 20, weight: .semibold)
    }
    
    private let titleDescriptionLabel = UILabel().then {
        $0.text = "최소 0개~최대 5개까지 중복 선택이 가능해요."
        $0.textColor = UIColor(red: 0.616, green: 0.624, blue: 0.671, alpha: 1)
        $0.font = UIFont.pretendard(size: 14, weight: .medium)
    }
    
    private lazy var sytleButtonTopStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 14
    }
    
    private lazy var sytleButtonBottomStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 14
    }
    
    private let sytleButtonStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 14
    }
    
    private let casualButton = MyPageInterestedButton(buttonTitle: "캐쥬얼")
    private let streetButton = MyPageInterestedButton(buttonTitle: "스트릿")
    private let feminineButton = MyPageInterestedButton(buttonTitle: "페미닌")
    private let minimalButton = MyPageInterestedButton(buttonTitle: "미니멀")
    private let sportyButton = MyPageInterestedButton(buttonTitle: "스포티")
    private let vintageButton = MyPageInterestedButton(buttonTitle: "빈티지")
    private let newtroButton = MyPageInterestedButton(buttonTitle: "뉴트로")
    private let normcoreButton = MyPageInterestedButton(buttonTitle: "놈코어")
    
    private let temperatureDescriptionLabel = UILabel().then {
        $0.text = "맞춤형 추천을 위해\n본인의 더위와 추위 민감도를 알려주세요."
        $0.textColor = UIColor(red: 0.616, green: 0.624, blue: 0.671, alpha: 1)
        $0.font = UIFont.pretendard(size: 14, weight: .medium)
        $0.numberOfLines = 2
    }
    
    let coldEditSlider = TemperatureSliderView(temperatureTitleText: "더위")
    let heatEditSlider = TemperatureSliderView(temperatureTitleText: "추위")
    
    let saveButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(size: 14, weight: .medium)
        $0.titleLabel?.textColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 13
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureLayout()
        configureAddTarget()
        backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure EditInterestView
extension EditInterestView {
    
    private func configureAddTarget() {
        [
            casualButton,
            streetButton,
            feminineButton,
            minimalButton,
            sportyButton,
            vintageButton,
            newtroButton,
            normcoreButton
        ].forEach {
            $0.addTarget(self, action: #selector(didTapStyleHashTagButton), for: .touchUpInside)
        }
        
        coldEditSlider.temperatureSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        heatEditSlider.temperatureSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    @objc private func didTapStyleHashTagButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            sender.configuration?.baseBackgroundColor = UIColor(red: 0.443, green: 0.608, blue: 0.902, alpha: 1)
            sender.configuration?.baseForegroundColor = .white
            sender.layer.borderWidth = 0
            hashTagArray.append(sender.titleLabel?.text! ?? "")
        } else {
            sender.configuration?.baseBackgroundColor = .white
            sender.configuration?.baseForegroundColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
            sender.layer.borderWidth = 1
            
            let buttonIndex: Int = hashTagArray.firstIndex(of: sender.titleLabel?.text ?? "")!
            hashTagArray.remove(at: buttonIndex)
        }
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        // sender가 coldSlider인지 heatSlider인지 확인하고 해당 변수에 값을 저장
        if sender == coldEditSlider.temperatureSlider {
            coldNumber = sender.value // 슬라이더의 현재 값을 coldNumber에 저장합니다.
        } else if sender == heatEditSlider.temperatureSlider {
            heatNumber = sender.value // 슬라이더의 현재 값을 heatNumber에 저장합니다.
        }
    }

    
}

// MARK: - Configure UI

extension EditInterestView {
    
    private func configureSubviews() {
        
        [casualButton, streetButton, feminineButton, minimalButton].forEach {
            sytleButtonTopStackView.addArrangedSubview($0)
        }
        
        [sportyButton, vintageButton, newtroButton, normcoreButton].forEach {
            sytleButtonBottomStackView.addArrangedSubview($0)
        }
        
        [sytleButtonTopStackView, sytleButtonBottomStackView].forEach {
            sytleButtonStackView.addArrangedSubview($0)
        }
        
        [
            titleLabel,
            titleDescriptionLabel,
            dividerView1,
            sytleButtonStackView,
            temperatureDescriptionLabel,
            dividerView2,
            heatEditSlider,
            dividerView3,
            coldEditSlider,
            dividerView4,
            saveButton
        ].forEach {
            addSubview($0)
        }
    }
    
    private  func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(12)
            make.leading.equalTo(safeAreaLayoutGuide).inset(19)
        }
        
        titleDescriptionLabel.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.032)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalTo(titleLabel)
        }
        
        dividerView1.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(titleDescriptionLabel.snp.bottom).offset(16)
            make.leading.equalTo(titleLabel)
        }
        
        sytleButtonStackView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.091)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(dividerView1.snp.bottom).offset(16)
            make.leading.equalTo(titleLabel)
        }
        
        temperatureDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(sytleButtonStackView.snp.bottom).offset(48)
            make.leading.equalTo(titleLabel)
        }
        
        dividerView2.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(temperatureDescriptionLabel.snp.bottom).offset(16)
            make.leading.equalTo(titleLabel)
        }

        heatEditSlider.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(dividerView2.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(44)
        }
        
        dividerView3.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(heatEditSlider.snp.bottom).offset(16)
            make.leading.equalTo(titleLabel)
        }
        
        coldEditSlider.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(dividerView3.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(44)
        }
        
        dividerView4.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(coldEditSlider.snp.bottom).offset(16)
            make.leading.equalTo(titleLabel)
        }
        
        saveButton.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.064)
            make.top.greaterThanOrEqualTo(dividerView4).offset(165)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(7)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
    }
    
}
