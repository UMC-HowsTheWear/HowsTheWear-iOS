//
//  WeatherBarButtonItem.swift
//  HowsTheWear
//
//  Created by Rafael on 1/3/24.
//

import UIKit

import SnapKit
import Then

class WeatherBarButtonItem: UIView {

    let menuButton = UIButton().then {
        $0.setImage(UIImage(named: "menu"), for: .normal)
    }

}
