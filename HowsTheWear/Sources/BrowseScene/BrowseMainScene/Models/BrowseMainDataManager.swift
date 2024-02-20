//
//  BrowseMainDataManager.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/20/24.
//

import UIKit

final class BrowseMainDataManager {
    
    private var thisWeekImagesDataArray: [BrowseMainDataModel] = [
        
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage1")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage2")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage3")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage4")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage5")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage6")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage7")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage8")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage4")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage3")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage6")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage7")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage5")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage2")),
        BrowseMainDataModel(images: UIImage(named: "ThisWeekTestImage1")),
    ]
    
    private var nextWeekImagesDataArray: [BrowseMainDataModel] = [
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage1")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage2")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage3")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage4")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage5")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage6")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage7")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage8")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage9")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage10")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage11")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage12")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage4")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage5")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage1")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage6")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage7")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage8")),
        BrowseMainDataModel(images: UIImage(named: "NextWeekTestImage9")),
    ]
    
    private var lastYearImagesDataArray: [BrowseMainDataModel] = [
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage1")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage2")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage3")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage4")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage5")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage6")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage7")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage8")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage9")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage10")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage11")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage4")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage5")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage2")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage3")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage1")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage9")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage10")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage11")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage4")),
        BrowseMainDataModel(images: UIImage(named: "LastYearTestImage5")),
    ]
    
    func fetchThisWeekImagesData() -> [BrowseMainDataModel] {
        return thisWeekImagesDataArray
    }
    
    func fetchNextWeekImagesData() -> [BrowseMainDataModel] {
        return nextWeekImagesDataArray
    }
    
    func fetchLastYearImagesData() -> [BrowseMainDataModel] {
        return lastYearImagesDataArray
    }
}
