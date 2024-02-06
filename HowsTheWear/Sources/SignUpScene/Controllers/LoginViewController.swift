//
//  LoginViewControllersViewController.swift
//  HowsTheWear
//
//  Created by 성대훈 on 2/6/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTargets()
        
    }
    
    private func setupAddTargets() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    

    @objc private func loginButtonDidTap() {
        let loginInfoVC = LoginInfoViewController()
        navigationController?.pushViewController(loginInfoVC, animated: true)
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4400014281, green: 0.4400013983, blue: 0.4400013983, alpha: 1)
    }
    
    
   

}
