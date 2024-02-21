//
//  OtherPeopleDetailViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/10/24.
//

import UIKit

final class OtherPeopleDetailViewController: UIViewController {

    let otherPeopleDetailView = OtherPeopleDetailView()
    
    var dataArray: UIImage? = UIImage(named: "")
    
    override func viewDidLoad() {
        view = otherPeopleDetailView
        super.viewDidLoad()
        configureInitialSetting()
        configureAddTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNaviBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController?.tabBar.isHidden = false
        otherPeopleDetailView.myPostButton.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let navigationController = navigationController,
           navigationController.topViewController is MyPostViewController
        {
            otherPeopleDetailView.myPostButton.isHidden = true
            tabBarController?.tabBar.isHidden = true
        }
    }

}

// MARK: - Configure InitialSetting

extension OtherPeopleDetailViewController {
    private func configureInitialSetting() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        configureNaviBar()
    }
    
    private func configureNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        appearance.titleTextAttributes = [
            .font: UIFont.pretendard(size: 16, weight: .semibold),
            .foregroundColor: UIColor.black
        ]
    
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black

        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        let backBarButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.title = "다른사람들은"
        navigationItem.backBarButtonItem = backBarButton
    }
    
}

// MARK: - Configure Action

extension OtherPeopleDetailViewController {
    private func configureAddTarget() {
        otherPeopleDetailView.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonDidTapped), for: .touchUpInside)
        otherPeopleDetailView.myPostButton.addTarget(self, action: #selector(myPostButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func bookmarkButtonDidTapped() {
        
        let transparentColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        let semiTransparentColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.66)
        let textColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)
        
        UIView.animate(withDuration: 0.2) {
            if self.otherPeopleDetailView.itemTagLabelContainerView.backgroundColor?.isEqual(transparentColor) ?? false {
                self.otherPeopleDetailView.itemTagLabelContainerView.backgroundColor = semiTransparentColor
                let transition = CATransition()
                transition.duration = 0.3
                self.otherPeopleDetailView.itemTagLabel.layer.add(transition, forKey: nil)
                self.otherPeopleDetailView.itemTagLabel.textColor = textColor
            } else {
                self.otherPeopleDetailView.itemTagLabelContainerView.backgroundColor = transparentColor
                let transition = CATransition()
                transition.duration = 0.3
                self.otherPeopleDetailView.itemTagLabel.layer.add(transition, forKey: nil)
                self.otherPeopleDetailView.itemTagLabel.textColor = transparentColor
            }
        }
    }
    
    @objc private func myPostButtonDidTap() {
        let myPostVC = MyPostViewController()
        navigationController?.pushViewController(myPostVC, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
    
}
