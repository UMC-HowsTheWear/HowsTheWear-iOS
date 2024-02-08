//
//  OthersViewController.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import UIKit

final class OthersViewController: UIViewController {
    
    private let othersView = OthersView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = othersView
        othersView.myPostButton.addTarget(self, action: #selector(myPostButtonDidTap), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController?.tabBar.isHidden = false
        othersView.myPostButton.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let navigationController = navigationController,
           navigationController.topViewController is MyPostViewController
        {
            othersView.myPostButton.isHidden = true
            tabBarController?.tabBar.isHidden = true
        }
    }
    
    @objc func myPostButtonDidTap() {
        let myPostVC = MyPostViewController()
        navigationController?.pushViewController(myPostVC, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }

}
