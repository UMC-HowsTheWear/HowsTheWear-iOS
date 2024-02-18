//
//  MyPageViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/18/24.
//

import UIKit

final class MyPageViewController: UIViewController {

    override func loadView() {
        view = MyPageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        navigationItem.title = "마이페이지"
        navigationItem.backBarButtonItem = backBarButton
    }

}
