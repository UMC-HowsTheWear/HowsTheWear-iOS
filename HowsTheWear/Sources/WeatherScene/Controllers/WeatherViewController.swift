//
//  WeatherViewController.swift
//  HowsTheWear
//
//  Created by Rafael on 1/3/24.
//

import UIKit

final class WeatherViewController: UIViewController {

    private let weatherBarButtonItem = WeatherBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureAddTargets()
    }

}

// MARK: - Navigation Bar Setup
private extension WeatherViewController {
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: weatherBarButtonItem.menuButton)
    }
}

// MARK: - Button Target Configuration
private extension WeatherViewController {
    func configureAddTargets() {
        weatherBarButtonItem.menuButton.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - Button Action Method
private extension WeatherViewController {
    @objc func menuButtonDidTap() {
        print("Clicked menu button")
    }
}
