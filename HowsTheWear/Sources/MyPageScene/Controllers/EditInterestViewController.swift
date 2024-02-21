//
//  EditInterestViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/21/24.
//

import UIKit

final class EditInterestViewController: UIViewController {
    
    let editInterestView = EditInterestView()
    
    override func loadView() {
        view = editInterestView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNaviBar()
//        configureSubview()
//        configureLayout()
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
        
        navigationItem.title = ""
        navigationItem.backBarButtonItem = backBarButton
    }

}

extension EditInterestViewController {
    private func configureSubview() {
        [editInterestView].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureLayout() {
        editInterestView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
