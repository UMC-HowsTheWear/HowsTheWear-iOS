//
//  Reusable.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/4/24.
//

import UIKit

// cellIdentifier 등록 시 아래처럼 사용 가능.
// withReuseIdentifier: ProfilePostCollectionViewCell.reuseIdentifier

protocol Reusable: AnyObject { }

extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionViewCell: Reusable { }

extension UITableViewCell: Reusable { }
