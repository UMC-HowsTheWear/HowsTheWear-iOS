//
//  MyPostView.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import UIKit

import SnapKit
import Then

final class MyPostView: UIView {
    
    private var selectedTagLabel: UILabel?
    private var selectedTags: [String] = []
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .clear
    }
    
    private let todayLookView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let todayLookTitle = UILabel().then {
        $0.text = "오늘의 룩을 공유해주세요!"
        $0.textColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1)
        $0.font = .pretendard(size: 16, weight: .semibold)
    }
    
    private let todayLookBackgroundImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "image.picker")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    let todayLookImageView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
        $0.showsHorizontalScrollIndicator = false
    }
    
    let pageControl = UIPageControl().then {
        $0.currentPage = 0
    }
    
    private let tagView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let customTagTitle = UILabel().then {
        $0.text = "강조하고 싶은 아이템을 입력해주세요!"
        $0.textColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1)
        $0.font = .pretendard(size: 16, weight: .semibold)
    }
    
    let customTagTextField = UITextField().then {
        $0.font = .pretendard(size: 14, weight: .regular)
        $0.textColor = .black
        $0.tintColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
        $0.placeholder = "제품명을 입력해주세요"
        $0.borderStyle = .none
        $0.clearButtonMode = .always
        $0.clearsOnBeginEditing = false
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.autocapitalizationType = .none
        $0.returnKeyType = .done
        $0.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 4
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
    }
    
    let customTagButton = UIButton().then {
        $0.setImage(UIImage(named: "tag"), for: .normal)
        $0.isEnabled = false
    }
    
    private lazy var customTagView = UIStackView(arrangedSubviews: [customTagTextField, customTagButton]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
    }
    
    private let customTagDeleteIcon = UIImageView().then {
        $0.image = UIImage(systemName: "xmark.circle.fill")?.withRenderingMode(.alwaysOriginal)
    }
    
    private let tagTitle = UILabel().then {
        $0.text = "스타일을 선택해주세요!"
        $0.textColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1)
        $0.font = .pretendard(size: 16, weight: .semibold)
    }
    
    private var tagButtons: [UIButton] = []
    
    private let tagStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    private var tagLabels: [UILabel] = []
    
    let descriptionView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let descriptionTitle = UILabel().then {
        $0.text = "날씨를 알려주세요!"
        $0.textColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1)
        $0.font = .pretendard(size: 16, weight: .semibold)
    }
    
    private let dateTitle = UILabel().then {
        $0.text = "날짜"
        $0.font = .pretendard(size: 16, weight: .medium)
        $0.textColor = UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1)
        $0.textAlignment = .left
    }
    
    let dateLabel = UILabel().then {
        $0.text = "날짜를 선택해주세요"
        $0.font = .pretendard(size: 14, weight: .regular)
        $0.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
    }
    
    private let emptyView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let calendarImageView = UIImageView().then {
        $0.image = UIImage(named: "calendar")
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var dateInfoView = UIStackView(arrangedSubviews: [dateLabel, emptyView, calendarImageView]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
        
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        
        $0.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.isLayoutMarginsRelativeArrangement = true
    }
    
    private lazy var dateView = UIStackView(arrangedSubviews: [dateTitle, dateInfoView]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 10
    }
    
    private let locationTitle = UILabel().then {
        $0.text = "위치"
        $0.font = .pretendard(size: 16, weight: .medium)
        $0.textColor = UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1)
        $0.textAlignment = .left
    }
    
    let locationTextField = UITextField().then {
        $0.font = .pretendard(size: 14, weight: .regular)
        $0.textColor = .black
        $0.tintColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
        $0.placeholder = "위치를 입력해주세요"
        $0.borderStyle = .none
        $0.clearButtonMode = .always
        $0.clearsOnBeginEditing = false
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.autocapitalizationType = .none
        $0.returnKeyType = .done
        $0.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 4
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
    }
    
    private lazy var locationView = UIStackView(arrangedSubviews: [locationTitle, locationTextField]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 10
    }
    
    private let feelsLikeTitle = UILabel().then {
        $0.text = "체감 날씨"
        $0.font = .pretendard(size: 16, weight: .medium)
        $0.textColor = UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1)
        $0.textAlignment = .left
    }
    
    let feelsLikeLabel = UILabel().then {
        $0.text = "체감이 어땠나요?"
        $0.font = .pretendard(size: 14, weight: .regular)
        $0.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
    }
    
    let downArrowImageView = UIImageView().then {
        $0.image = UIImage(named: "down")
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var feelsLikeInfoView = UIStackView(arrangedSubviews: [feelsLikeLabel, emptyView, downArrowImageView]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
        
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        
        $0.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.isLayoutMarginsRelativeArrangement = true
    }
    
    lazy var feelsLikeView = UIStackView(arrangedSubviews: [feelsLikeTitle, feelsLikeInfoView]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 10
    }
    
    private lazy var descriptionInfoView = UIStackView(arrangedSubviews: [dateView, locationView, feelsLikeView]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 24
    }
    
    let uploadButton = UIButton().then {
        $0.setTitle("올리기", for: .normal)
        $0.backgroundColor = .black
        $0.titleLabel?.font = .pretendard(size: 20, weight: .medium)
        $0.titleLabel?.textColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.isEnabled = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        todayLookView.applyShadow()
        tagView.applyShadow()
        descriptionView.applyShadow()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UI Configuration

private extension MyPostView {
    
    func configureUI() {
        backgroundColor = #colorLiteral(red: 0.9813271165, green: 0.9813271165, blue: 0.9813271165, alpha: 1)
        addSubview(scrollView)
        
        setupScrollView()
        setupTodayLookView()
        setupTagView()
        setupDescriptionView()
        
        uploadButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(descriptionView.snp.bottom).offset(20)
            $0.left.equalTo(20)
            $0.bottom.equalTo(scrollView).inset(10)
            $0.height.equalTo(50)
        }
    }
    
    func setupTodayLookView() {
        todayLookView.addSubviews([
            todayLookTitle, todayLookBackgroundImageView, todayLookImageView, pageControl
        ])
        
        todayLookView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(20)
            $0.left.equalTo(20)
        }
        
        todayLookTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.left.equalTo(20)
        }
        
        todayLookBackgroundImageView.snp.makeConstraints {
            $0.centerX.left.equalTo(todayLookTitle)
            $0.top.equalTo(todayLookTitle.snp.bottom).offset(20)
            $0.bottom.equalTo(-20)
            $0.height.equalTo(369)
        }
        
        todayLookImageView.snp.makeConstraints {
            $0.centerX.left.equalTo(todayLookTitle)
            $0.top.equalTo(todayLookTitle.snp.bottom).offset(20)
            $0.bottom.equalTo(-20)
            $0.height.equalTo(369)
        }
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(-20)
        }
    }
    
    func setupTagView() {
        tagView.addSubviews([customTagTitle, customTagView, tagTitle])
        
        setupTagButtons()
        tagView.addSubview(tagStackView)
        
        tagView.snp.makeConstraints {
            $0.centerX.left.equalTo(todayLookView)
            $0.top.equalTo(todayLookView.snp.bottom).offset(20)
        }
        
        customTagTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.left.equalTo(20)
        }
        
        customTagTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        customTagButton.snp.makeConstraints {
            $0.width.equalTo(32)
        }
        
        // 텍스트 필드가 필요 이상으로 늘어나지 않도록 설정
        customTagTextField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        customTagTextField.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        // 버튼이 축소되지 않도록 설정
        customTagButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        customTagButton.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        customTagView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(customTagTitle.snp.bottom).offset(20)
            $0.left.equalTo(customTagTitle)
        }
        
        tagTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(customTagView.snp.bottom).offset(30)
            $0.left.equalTo(customTagView)
        }
        
        tagStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tagTitle.snp.bottom).offset(20)
            $0.left.equalTo(tagTitle)
            $0.bottom.equalTo(-20)
        }
    }
    
    func setupDescriptionView() {
        descriptionView.addSubview(descriptionTitle)
        descriptionView.addSubview(descriptionInfoView)
        
        descriptionView.snp.makeConstraints {
            $0.centerX.left.equalTo(tagView)
            $0.top.equalTo(tagView.snp.bottom).offset(20)
            $0.bottom.equalTo(-90)
        }
        
        descriptionTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.left.equalTo(20)
        }
        
        descriptionInfoView.snp.makeConstraints {
            $0.centerX.left.equalTo(descriptionTitle)
            $0.top.equalTo(descriptionTitle.snp.bottom).offset(24)
            $0.bottom.equalTo(-20)
        }
        
        dateTitle.snp.makeConstraints {
            $0.width.equalTo(60)
        }
        
        locationTitle.snp.makeConstraints {
            $0.width.equalTo(60)
        }
        
        locationTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        feelsLikeTitle.snp.makeConstraints {
            $0.width.equalTo(60)
        }
    }
    
    func setupScrollView() {
        scrollView.addSubview(todayLookView)
        scrollView.addSubview(tagView)
        scrollView.addSubview(descriptionView)
        scrollView.addSubview(uploadButton)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

// MARK: - User Interaction

private extension MyPostView {
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        guard let label = gesture.view as? PaddedLabel else { return }
        
        let translation = gesture.translation(in: self.todayLookImageView)
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
        gesture.setTranslation(.zero, in: self.todayLookImageView)
    }
    
    @objc func tagButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            updateButtonStyle(sender, isSelected: true)
        } else {
            updateButtonStyle(sender, isSelected: false)
        }
    }
    
    @objc func tagLabelTapped(_ gesture: UITapGestureRecognizer) {
        guard let tappedLabel = gesture.view as? PaddedLabel else { return }
        tappedLabel.removeFromSuperview()
    }
    
}

// MARK: - View Setup and Update

extension MyPostView {
    
    func updateScrollView(with images: [UIImage]) {
        todayLookImageView.subviews.forEach { $0.removeFromSuperview() }
        
        for (index, image) in images.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.frame = CGRect(
                x: CGFloat(index) * todayLookImageView.frame.width,
                y: 0,
                width: todayLookImageView.frame.width,
                height: todayLookImageView.frame.height
            )
            
            todayLookImageView.addSubview(imageView)
        }
        
        todayLookImageView.contentSize = CGSize(
            width: todayLookImageView.frame.width * CGFloat(images.count),
            height: todayLookImageView.frame.height
        )
        
        pageControl.numberOfPages = images.count
        pageControl.isHidden = images.count == 1
    }
    
    func setupTagButtons() {
        let tags = ["캐주얼", "스트릿", "페미닌", "미니멀", "스포티", "빈티지", "뉴트로", "놈코어"]
        
        let firstGroup = Array(tags.prefix(4))
        let secondGroup = Array(tags.suffix(4))
        
        let firstHorizontalStackView = createHorizontalStackView(withTags: firstGroup)
        let secondHorizontalStackView = createHorizontalStackView(withTags: secondGroup)
        
        tagStackView.addArrangedSubview(firstHorizontalStackView)
        tagStackView.addArrangedSubview(secondHorizontalStackView)
        
        tagStackView.axis = .vertical
        tagStackView.spacing = 10
        tagStackView.distribution = .fillEqually
        tagStackView.alignment = .fill
        
        tagView.addSubview(tagStackView)
    }
    
    func createHorizontalStackView(withTags tags: [String]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        tags.forEach { tagName in
            let button = createButton(withTitle: tagName)
            stackView.addArrangedSubview(button)
        }
        
        return stackView
    }
    
    func createButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.setAttributedTitle(
            NSAttributedString(
                string: title,
                attributes: [
                    .font: UIFont.pretendard(size: 14, weight: .medium),
                    .foregroundColor: UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
                ]
            ), for: .normal
        )
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        button.layer.cornerRadius = 13
        button.sizeToFit()
        button.addTarget(self, action: #selector(tagButtonDidTap), for: .touchUpInside)
        return button
    }
    
    func updateButtonStyle(_ button: UIButton, isSelected: Bool) {
        if isSelected {
            button.backgroundColor = UIColor(red: 0.444, green: 0.607, blue: 0.901, alpha: 1)
            button.layer.borderWidth = 0
            let selectedTitle = NSAttributedString(
                string: button.titleLabel?.text ?? "",
                attributes: [
                    .font: UIFont.pretendard(size: 14, weight: .medium),
                    .foregroundColor: UIColor.white
                ]
            )
            button.setAttributedTitle(selectedTitle, for: .normal)
        } else {
            button.backgroundColor = .clear
            button.layer.borderWidth = 1
            let unselectedTitle = NSAttributedString(
                string: button.titleLabel?.text ?? "",
                attributes: [
                    .font: UIFont.pretendard(size: 14, weight: .medium),
                    .foregroundColor: UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
                ]
            )
            button.setAttributedTitle(unselectedTitle, for: .normal)
        }
    }

    func positionTagView(_ view: UIView, within scrollView: UIScrollView) {
        scrollView.addSubview(view)
        view.isUserInteractionEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    func createTagLabel(withText text: String) -> PaddedLabel {
        let label = PaddedLabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)
        label.numberOfLines = 2
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        label.font = .pretendard(size: 12, weight: .medium)
        label.layer.cornerRadius = 16
        label.clipsToBounds = true
        label.topInset = 8
        label.bottomInset = 8
        label.leftInset = 16
        label.rightInset = 16
        
        addTapGestureToTagLabel(label)
        return label
    }
    
    func addTapGestureToTagLabel(_ label: PaddedLabel) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tagLabelTapped))
        label.addGestureRecognizer(tapGesture)
    }
    
}

// MARK: - UIScrollViewDelegate

extension MyPostView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
    }
    
}
