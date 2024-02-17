//
//  CalendarView.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import UIKit

import SnapKit
import Then

final class CalendarView: UIView {
    
    var selectedDate: Date?
    
    private lazy var calendarView = UICalendarView().then {
        $0.calendar = Calendar(identifier: .gregorian)
        $0.timeZone = .autoupdatingCurrent
        $0.locale = .current
        $0.fontDesign = .default
        $0.selectionBehavior = singleDateSelection
        $0.delegate = self
    }
    
    private lazy var singleDateSelection = UICalendarSelectionSingleDate(delegate: self)
    
    lazy var selectionButton = UIButton().then {
        $0.setTitle("선택하기", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
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
        addSubview(calendarView)
        addSubview(selectionButton)
        
        calendarView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.left.equalTo(20)
        }
        
        selectionButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(calendarView.snp.bottom).offset(20)
            $0.left.equalTo(calendarView)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            $0.height.equalTo(50)
        }
    }
    
}

extension CalendarView: UICalendarViewDelegate {
    
    
    
}

extension CalendarView: UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        if let date = dateComponents?.date {
            self.selectedDate = date
        }
    }
    
}
