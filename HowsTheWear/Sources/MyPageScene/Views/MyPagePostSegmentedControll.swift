//
//  MyPageSementControll.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/17/24.
//

import UIKit

final class MyPagePostSegmentedControll: UISegmentedControl {
    
    private let underLine = UIView()
    private let normalColor: UIColor
    private let selectedColor: UIColor
    private let font: UIFont
    
    init(items: [Any]?, normalColor: UIColor, selectedColor: UIColor, font: UIFont = UIFont.pretendard(size: 15, weight: .semibold)) {
        self.normalColor = normalColor
        self.selectedColor = selectedColor
        self.font = font
        super.init(items: items)
        removeInitialImage()
        setupInitialStatus()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupTitleAttributes()
        configureUnderLineView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let originX = frame.width / CGFloat(numberOfSegments) * CGFloat(selectedSegmentIndex)
        
        UIView.animate(withDuration: 0.1) {
            self.underLine.frame.origin.x = originX
        }
    }
    
}

// MARK: - Configure SegmentedControl

extension MyPagePostSegmentedControll {
    
    private func setupTitleAttributes() {
        setTitleTextAttributes([.foregroundColor: normalColor, .font: font], for: .normal)
        setTitleTextAttributes([.foregroundColor: selectedColor, .font: font], for: .selected)
    }
    
    private func setupInitialStatus() {
        selectedSegmentIndex = 0
    }
    
    private func removeInitialImage() {
        setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
}

// MARK: - Configure UI

extension MyPagePostSegmentedControll {
    
    private func configureUnderLineView() {
        let originX: CGFloat = 0
        let originY: CGFloat = bounds.size.height - 3           // 걷느려보기
        let width: CGFloat = bounds.size.width / CGFloat(numberOfSegments)
        let height: CGFloat = 1                                 // 건드려보기
        
        underLine.frame = CGRect(x: originX, y: originY, width: width, height: height)
        
        underLine.backgroundColor = selectedColor
        addSubview(underLine)
    }
}
