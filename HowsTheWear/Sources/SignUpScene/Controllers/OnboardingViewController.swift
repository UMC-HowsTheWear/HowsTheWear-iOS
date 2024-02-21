//
//  OnboardingViewController.swift
//  HowsTheWear
//
//  Created by RAFA on 2/21/24.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private let onboardingView = OnboardingView()
    private let onboardingData = Onboarding.items
    
    override func loadView() {
        view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.collectionView.dataSource = self
        onboardingView.collectionView.delegate = self
        onboardingView.collectionView.register(
            OnboardingCell.self,
            forCellWithReuseIdentifier: OnboardingCell.reuseIdentifier
        )
        
        configureAddTargets()
    }
    
    private func configureAddTargets() {
        onboardingView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        onboardingView.joinButton.addTarget(self, action: #selector(joinButtonDidTap), for: .touchUpInside)
        onboardingView.startAsNonMemberButton.addTarget(self, action: #selector(startAsNonMemberButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func loginButtonDidTap() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    @objc private func joinButtonDidTap() {
        let firstStepJoinVC = FirstStepJoinVC()
        navigationController?.pushViewController(firstStepJoinVC, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    @objc private func startAsNonMemberButtonDidTap() {
        let homeVC = TabBarController()
        homeVC.modalTransitionStyle = .coverVertical
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
    }
    
}

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.reuseIdentifier, for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        let data = onboardingData[indexPath.item]
        cell.configure(data)
        return cell
    }
    
}

extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        let index = Int((scrollView.contentOffset.x + (width / 2)) / width)
        onboardingView.pageControl.currentPage = index
    }
    
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
}
