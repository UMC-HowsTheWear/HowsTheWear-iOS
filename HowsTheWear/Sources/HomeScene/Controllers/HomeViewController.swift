//
//  HomeViewController.swift
//  HowsTheWear
//
//  Created by Rafael on 1/3/24.
//

import UIKit

final class HomeViewController: UIViewController {

    private let customBarButtonItem = CustomBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBarUI()
        configureAddTargets()
    }

}

// MARK: - Navigation Bar Setup

private extension HomeViewController {
    
    func configureNavBarUI() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .clear
        appearance.shadowColor = nil
        navigationController?.navigationBar.standardAppearance = appearance
        
        setupNavigationBarButton()
    }
    
    func setupNavigationBarButton() {
        let rightButton = UIBarButtonItem(customView: customBarButtonItem.locationButton)
        navigationItem.rightBarButtonItem = rightButton
    }
    
}

// MARK: - Button Target Configuration

private extension HomeViewController {
    
    func configureAddTargets() {
        customBarButtonItem.locationButton.addTarget(
            self,
            action: #selector(locationButtonDidTap),
            for: .touchUpInside
        )
    }
    
}

// MARK: - Button Action Method

private extension HomeViewController {
    
    @objc func locationButtonDidTap() {
        print("Clicked")
    }
    
}
