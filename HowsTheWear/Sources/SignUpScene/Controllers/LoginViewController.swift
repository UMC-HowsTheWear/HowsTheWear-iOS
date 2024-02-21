//
//  LoginViewControllersViewController.swift
//  HowsTheWear
//
//  Created by 성대훈 on 2/6/24.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
