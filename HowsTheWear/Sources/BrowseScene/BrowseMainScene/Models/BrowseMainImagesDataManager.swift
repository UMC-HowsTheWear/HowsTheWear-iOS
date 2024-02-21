//
//  BrowseMainImagesDataManager.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/18/24.
//

import UIKit

final class BrowseMainImagesDataManager {
    private var mypostImagesDataArray: [MyPostImagesDataModel] = [
        MyPostImagesDataModel(postImages: UIImage(named: "MyPageTestImage")),
        MyPostImagesDataModel(postImages: UIImage(named: "MyPageTestImage2")),
        MyPostImagesDataModel(postImages: UIImage(named: "MyPageTestImage3")),
        MyPostImagesDataModel(postImages: UIImage(named: "MyPageTestImage2")),
    ]
    
    func fetchMyPostImagesData() -> [MyPostImagesDataModel] {
        return mypostImagesDataArray
    }
}
