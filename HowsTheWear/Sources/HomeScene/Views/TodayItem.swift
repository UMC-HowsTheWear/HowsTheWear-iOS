//
//  TodayItem.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import Foundation

struct TodayItem {
    let image: String
    let name: String
}

extension TodayItem {
    static let items: [TodayItem] = [
        TodayItem(image: "1", name: "니트"),
        TodayItem(image: "2", name: "아우터"),
        TodayItem(image: "3", name: "머플러")
    ]
}
