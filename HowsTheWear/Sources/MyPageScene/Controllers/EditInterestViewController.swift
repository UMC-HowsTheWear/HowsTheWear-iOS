//
//  EditInterestViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/21/24.
//

import UIKit

final class EditInterestViewController: UIViewController {
    
    private let editInterestView = EditInterestView()
    private let myPageViewController = MyPageViewController()
    
    override func loadView() {
        view = editInterestView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNaviBar()
        configureAddTarget()
    }
    
    private func configureNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        appearance.titleTextAttributes = [
            .font: UIFont.pretendard(size: 16, weight: .semibold),
            .foregroundColor: UIColor.black
        ]
    
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black

        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        let backBarButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.title = ""
        navigationItem.backBarButtonItem = backBarButton
    }

}

extension EditInterestViewController {
    private func configureAddTarget() {
        editInterestView.saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
    }
    
    // MARK: - 여기여기
    @objc private func didTapSaveButton() {
        myPageViewController.hashTagArray = editInterestView.hashTagArray
        myPageViewController.heatNumber = editInterestView.heatNumber
        myPageViewController.coldNumber = editInterestView.coldNumber
        
        navigationController?.pushViewController(myPageViewController, animated: true)
    }
    
    
}
