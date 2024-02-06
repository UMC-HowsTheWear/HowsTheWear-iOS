//
//  LoginInfoViewController.swift
//  HowsTheWear
//
//  Created by 성대훈 on 2/6/24.
//

import UIKit

class LoginInfoViewController: UIViewController, UITextFieldDelegate {
    
    private let loginInfoView = LoginInfoView()
    
    
    
    override func loadView() {
        view = loginInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTargets()
        loginInfoView.becomeFirstResponder()
        loginInfoView.idTextField.delegate = self
        loginInfoView.pwTextField.becomeFirstResponder()
        loginInfoView.pwTextField.delegate = self
    }
    
    private func setupAddTargets() {
        loginInfoView.confirmButton.addTarget(self, action: #selector(confirmButtonDidTap), for: .touchUpInside)
        
    }
    
    
    
    @objc private func confirmButtonDidTap() {
        let loginInfoCheckVC = LoginInfoCheckViewController()
        navigationController?.pushViewController(loginInfoCheckVC, animated: true)
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4400014281, green: 0.4400013983, blue: 0.4400013983, alpha: 1)
        
    }
    
    
}
