//
//  WeatherViewController.swift
//  HowsTheWear
//
//  Created by Rafael on 1/3/24.
//

import UIKit

final class WeatherViewController: UIViewController {

    private let customBarButtonItem = CustomBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureAddTargets()
    }

}

// MARK: - Navigation Bar Setup
private extension WeatherViewController {
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customBarButtonItem.locationButton)
    }
}

// MARK: - Button Target Configuration
private extension WeatherViewController {
    func configureAddTargets() {
        customBarButtonItem.locationButton.addTarget(self, action: #selector(locationButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - Button Action Method
private extension WeatherViewController {
    @objc func locationButtonDidTap() {
        print("Clicked")
    }
}
