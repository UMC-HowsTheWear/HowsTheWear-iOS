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
        setupNavigationBar()
        configureAddTargets()
    }

}

// MARK: - Navigation Bar Setup
private extension HomeViewController {
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customBarButtonItem.locationButton)
    }
}

// MARK: - Button Target Configuration
private extension HomeViewController {
    func configureAddTargets() {
        customBarButtonItem.locationButton.addTarget(self, action: #selector(locationButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - Button Action Method
private extension HomeViewController {
    @objc func locationButtonDidTap() {
        print("Clicked")
    }
}
