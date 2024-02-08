//
//  CustomBarButtonItem.swift
//  HowsTheWear
//
//  Created by Rafael on 1/3/24.
//

import UIKit

import Then

final class CustomBarButtonItem: UIView {

    let locationButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(named: "location-pin")
        config.attributedTitle = AttributedString(
            NSAttributedString(
                string: "Location",
                attributes: [.font: UIFont.pretendard(size: 13, weight: .medium)]
            )
        )
        config.baseBackgroundColor = .black
        config.imagePadding = 5
        config.cornerStyle = .capsule
        
        $0.configuration = config
    }

}
