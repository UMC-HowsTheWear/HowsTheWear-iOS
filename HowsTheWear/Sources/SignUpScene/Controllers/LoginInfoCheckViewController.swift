//
//  LoginInfoCheckViewController.swift
//  HowsTheWear
//
//  Created by 성대훈 on 2/6/24.
//

import UIKit

class LoginInfoCheckViewController: UIViewController {
    
    private let loginInfoCheckView = LoginInfoCheckView()
    
    
    override func loadView() {
        // super.loadView() 필요없음
        view = loginInfoCheckView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTargets()
        
        
        
    }
    
    private func setupAddTargets() {
        loginInfoCheckView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        
    }
    
    @objc private func nextButtonDidTap() {
        let loginInfoCheckVC = ProfileViewController()
        navigationController?.pushViewController(loginInfoCheckVC, animated: true)
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4400014281, green: 0.4400013983, blue: 0.4400013983, alpha: 1)
    }
    
}
