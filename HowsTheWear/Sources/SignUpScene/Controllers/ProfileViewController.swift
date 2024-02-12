//
//  ProfileViewController.swift
//  HowsTheWear
//
//  Created by 성대훈 on 2/12/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTargets()
    }
    
    private func setupAddTargets() {
        profileView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        
    }
    
    @objc private func nextButtonDidTap() {
        let profileVC = InterestViewController()
        navigationController?.pushViewController(profileVC, animated: true)
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4400014281, green: 0.4400013983, blue: 0.4400013983, alpha: 1)
    }

}
