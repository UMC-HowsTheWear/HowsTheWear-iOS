//
//  Onboarding.swift
//  HowsTheWear
//
//  Created by RAFA on 2/21/24.
//

import Foundation

struct Onboarding {
    let description: String
    let image: String
}

extension Onboarding {
    static let items: [Onboarding] = [
        Onboarding(description: "현재 위치의 정확한 날씨를\n확인해보세요!", image: "first"),
        Onboarding(description: "온도, 날씨를 확인하고\n맞는 옷차림을 참고하세요!", image: "second"),
        Onboarding(description: "기온별 맞춤 옷차림 추천으로\n더욱 선택을 간편하게 해보세요!", image: "third"),
    ]
}
