//
//  OtherPeopleDetailViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/10/24.
//

import UIKit

final class OtherPeopleDetailViewController: UIViewController {

    override func loadView() {
        view = OtherPeopleDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
    }

}


// MARK: - Configure InitialSetting

extension OtherPeopleDetailViewController {
    private func configureInitialSetting() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        navigationItem.title = "다른 사람들은"
    }
    
}
