//
//  NextWeekData.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/18/24.
//

import UIKit

final class BrowseMainImagesDataManager {
    
    private var thisWeekImagesDataArray: [BrowseStyleDataModel] = [
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage1")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage2")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage3")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage4")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage5")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage6")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage7")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage8")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage4")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage3")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage2")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage7")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage1")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage9")),
    BrowseStyleDataModel(images: UIImage(named: "ThisWeekTestImage5")),
    ]
    
    private var nextWeekImagesDataArray: [BrowseStyleDataModel] = [
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage1")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage2")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage3")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage4")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage5")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage6")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage7")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage8")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage9")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage10")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage11")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage12")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage4")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage5")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage1")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage6")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage7")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage8")),
    BrowseStyleDataModel(images: UIImage(named: "NextWeekTestImage9")),
    ]
    
    private var lastYearImagesDataArray: [BrowseStyleDataModel] = [
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage1")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage2")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage3")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage4")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage5")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage6")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage7")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage8")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage9")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage10")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage11")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage4")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage5")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage2")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage3")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage1")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage9")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage10")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage11")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage4")),
    BrowseStyleDataModel(images: UIImage(named: "LastYearTestImage5")),
    ]
    
    func fetchThisWeekImagesData() -> [BrowseStyleDataModel] {
        return thisWeekImagesDataArray
    }
    
    func fetchNextWeekImagesData() -> [BrowseStyleDataModel] {
        return nextWeekImagesDataArray
    }
    
    func fetchLastYearImagesData() -> [BrowseStyleDataModel] {
        return lastYearImagesDataArray
    }
}
