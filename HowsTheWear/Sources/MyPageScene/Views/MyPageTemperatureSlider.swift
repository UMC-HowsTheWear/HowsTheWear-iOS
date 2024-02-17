//
//  MyPageTemperatureSlider.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/16/24.
//

import UIKit

final class MyPageTemperatureSlider: UISlider {
    
    var circles: [UIView] = []
    
    private let circleMargin: CGFloat = 10.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureInitialSetting()
        configureAddTarget()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if circles.isEmpty {
            configureCircles()
        }
        updateCirclePositions()
    }
}

// MARK: - Configure InitialSetting

extension MyPageTemperatureSlider {
    private func configureInitialSetting() {
        minimumValue = 0
        maximumValue = 4
        thumbTintColor = UIColor(red: 0.444, green: 0.607, blue: 0.901, alpha: 1)
        minimumTrackTintColor = UIColor(red: 0.444, green: 0.607, blue: 0.901, alpha: 1)
        maximumTrackTintColor = #colorLiteral(red: 0.8534707427, green: 0.8671818376, blue: 0.8862800002, alpha: 1)
    }
}

// MARK: - Configure Circles

extension MyPageTemperatureSlider {
    private func configureCircles() {
        let circleCount = 5
        let trackRect = self.trackRect(forBounds: bounds)
        
        for i in 0..<circleCount {
            let circle = UIView()
            circle.isUserInteractionEnabled = false
            let value = (maximumValue - minimumValue) * Float(i) / Float(circleCount - 1) + minimumValue
            let xPosition = positionForValue(value)
            circle.frame = CGRect(x: xPosition, y: trackRect.midY, width: 10, height: 10)
            circle.backgroundColor = #colorLiteral(red: 0.8534707427, green: 0.8671818376, blue: 0.8862800002, alpha: 1)
            circle.layer.cornerRadius = circle.frame.size.width / 2.0
            circle.layer.zPosition = -1
            
            addSubview(circle)
            circles.append(circle)
        }
    }

    private func positionForValue(_ value: Float) -> CGFloat {
        let trackRect = self.trackRect(forBounds: bounds)
        let minValuePosition = trackRect.minX + (circleMargin / 2)
        let maxValuePosition = trackRect.maxX - (circleMargin / 2)
        let positionRange = maxValuePosition - minValuePosition
        let valueRange = CGFloat(maximumValue - minimumValue)
        let valuePosition = CGFloat(value - minimumValue) / valueRange * positionRange + minValuePosition
        return valuePosition
    }

    private func updateCirclePositions() {
        let trackRect = self.trackRect(forBounds: bounds)
        
        for (index, circle) in circles.enumerated() {
            let value = (maximumValue - minimumValue) * Float(index) / Float(circles.count - 1) + minimumValue
            let xPosition = positionForValue(value)
            circle.center.x = xPosition
            circle.center.y = trackRect.midY
        }
    }
    
}

// MARK: - Configure Action

extension MyPageTemperatureSlider {
    
    private func configureAddTarget() {
        addTarget(self, action: #selector(headSliderValueChanged), for: .valueChanged)
        addTarget(self, action: #selector(updateCircleColors), for: .valueChanged)
    }
    
    @objc private func headSliderValueChanged(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        updateCircleColors()
    }
    
    @objc private func updateCircleColors() {
        for (index, circle) in circles.enumerated() {
            let circleValue = Float(index)
            circle.backgroundColor = circleValue <= self.value ?
                UIColor(red: 0.444, green: 0.607, blue: 0.901, alpha: 1) :
                #colorLiteral(red: 0.8534707427, green: 0.8671818376, blue: 0.8862800002, alpha: 1)
        }
    }
    
}
