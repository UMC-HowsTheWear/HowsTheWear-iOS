//
//  FirstStepJoinVC.swift
//  HowsTheWear
//
//  Created by RAFA on 2/21/24.
//

import UIKit

final class FirstStepJoinVC: UIViewController {
    
    private let firstStepView = FirstStepJoinView()
    
    override func loadView() {
        view = firstStepView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
