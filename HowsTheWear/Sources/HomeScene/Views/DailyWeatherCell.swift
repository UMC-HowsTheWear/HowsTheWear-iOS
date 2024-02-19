//
//  DailyWeatherCell.swift
//  HowsTheWear
//
//  Created by RAFA on 1/29/24.
//

import CoreLocation
import UIKit
import WeatherKit

import SnapKit
import Then

final class DailyWeatherCell: UITableViewCell {
    
    static let cellHeight = 555.0
    
    var weather: ParsedWeather?
    var dailyForecast: [DayWeather] = []
    
    var city: (name: String, placemarkTitle: String, lat: Double, long: Double, timeZone: String) = ("MyCity", "placemarkTitle", 40.86, -74.12, "EST") {
        didSet {
            WeatherDataCenter.shared.getWeatherForLocation(
                location: CLLocation(
                    latitude: city.lat,
                    longitude: city.long
                )
            ) { result in
                switch result {
                case .success(let weather):
                    self.weather = weather
                    self.parse(weather: weather)
                case .failure(let error):
                    print(error)
                }
            }
            
            collectionView.reloadData()
        }
    }
    
    func parse(weather: ParsedWeather) {
        self.dailyForecast = Array(weather.dailyForecast)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private let shadowContainerView = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowRadius = 20
        $0.layer.shadowOpacity = 1
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.register(
            DailyCollectionCell.self,
            forCellWithReuseIdentifier: DailyCollectionCell.reuseIdentifier
        )
        return collectionView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UICollectionViewDataSource

extension DailyWeatherCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyForecast.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyCollectionCell.reuseIdentifier, for: indexPath) as? DailyCollectionCell else {
            return UICollectionViewCell()
        }
        let dailyWeather = dailyForecast[indexPath.row]
        cell.prepare(dayWeather: dailyWeather, timeZone: city.timeZone)
        return cell
    }
    
}

// MARK: - UI Configuration

private extension DailyWeatherCell {
    
    func configureUI() {
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        contentView.addSubview(shadowContainerView)
        shadowContainerView.snp.makeConstraints {
            $0.top.left.equalTo(20)
            $0.bottom.right.equalTo(-20)
        }

        shadowContainerView.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 20
        collectionView.clipsToBounds = true
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(40)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}
