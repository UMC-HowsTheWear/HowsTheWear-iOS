//
//  OtherPeopleViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/7/24.
//

import UIKit

final class OtherPeopleViewController: UIViewController {
    
    private let otherPeopleView = OtherPeopleView()
    
    override func loadView() {
        view = otherPeopleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController?.tabBar.isHidden = false
        otherPeopleView.myPostButton.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let navigationController = navigationController,
           navigationController.topViewController is MyPostViewController
        {
            otherPeopleView.myPostButton.isHidden = true
            tabBarController?.tabBar.isHidden = true
        }
    }

}

// MARK: - Configure Action

extension OtherPeopleViewController {
    private func configureAction() {
        otherPeopleView.myPostButton.addTarget(self, action: #selector(myPostButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func myPostButtonDidTap() {
        let myPostVC = MyPostViewController()
        navigationController?.pushViewController(myPostVC, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
    
}
