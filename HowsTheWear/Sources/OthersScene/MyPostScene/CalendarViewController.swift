//
//  CalendarViewController.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import UIKit

protocol CalendarViewControllerDelegate: AnyObject {
    func didSelectDate(_ date: Date)
}

final class CalendarViewController: UIViewController {
    
    weak var delegate: CalendarViewControllerDelegate?
    
    private let calendarView = CalendarView()
    
    override func loadView() {
        view = calendarView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    private func addTargets() {
        calendarView.selectionButton.addTarget(self, action: #selector(selectionButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func selectionButtonDidTap() {
        if let selectedDate = calendarView.selectedDate {
            delegate?.didSelectDate(selectedDate)
        }
        dismiss(animated: true)
    }

}
