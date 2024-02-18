//
//  MyPageViewController.swift
//  HowsTheWear
//
//  Created by 제민우 on 2/17/24.
//

import UIKit

final class PostPagingViewController: UIViewController {
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private let segmentControl: MyPageSementedControll = {
        let segmentedcontroll = MyPageSementedControll(
            items: ["내 게시물", "저장된 게시물"],
            normalColor: UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1),
            selectedColor:  UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1)
        )
        return segmentedcontroll
    }()
    
    private let viewControllers: [UIViewController]
    
    private var currentIndex: Int = 0 {
        didSet {
            let nextViewController = viewControllers[currentIndex]
            let direction: UIPageViewController.NavigationDirection = oldValue < currentIndex ? .forward : .reverse
            pageViewController.setViewControllers([nextViewController], direction: direction, animated: true)
        }
    }
    
    init?(viewControllers: [UIViewController]) {
        guard viewControllers.count == 2 else {
            fatalError("ViewControllers count must be two")
        }

        self.viewControllers = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSegmentedControlInitialSetting()
        configureSegmentedControlLayout()
        configurePageViewControllerInitialSetting()
        configurePageViewControllerLayout()
    }

}

// MARK: Implement PageViewController Delegate

extension PostPagingViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        willTransitionTo pendingViewControllers: [UIViewController]
    ) {
        guard let nextViewController = pendingViewControllers.first,
              let index = viewControllers.firstIndex(of: nextViewController)
        else {
            return
        }
        
        segmentControl.selectedSegmentIndex = index
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard let currentViewController = pageViewController.viewControllers?.first,
              let index = viewControllers.firstIndex(of: currentViewController)
        else {
            return
        }
        
        segmentControl.selectedSegmentIndex = index
    }
    
}

// MARK: Implement PageViewController DataSource

extension PostPagingViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController),
              (index - 1) >= 0
        else {
            return nil
        }
        
        return viewControllers[index - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController),
              (index + 1) != viewControllers.count
        else {
            return nil
        }
        
        return viewControllers[index + 1]
    }
    
}

// MARK: Configure PageViewController

extension PostPagingViewController {
    private func configurePageViewControllerInitialSetting() {
        if let firstViewController = viewControllers.first {
            pageViewController.setViewControllers(
                [firstViewController],
                direction: .reverse,
                animated: true
            )
        }
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
    
    private func configurePageViewControllerLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        guard let pageView = pageViewController.view else { return }
        
        view.addSubview(pageView)
        
        pageView.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom)
            make.bottom.trailing.equalTo(safeArea)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
}

// MARK: Configure SegmentedControl

extension PostPagingViewController {
    @objc private func tapSegmentedControl(_ sender: UISegmentedControl) {
        currentIndex = sender.selectedSegmentIndex
    }
    
    private func configureSegmentedControlInitialSetting() {
        view.addSubview(segmentControl)
        segmentControl.addTarget(self, action: #selector(tapSegmentedControl(_:)), for: .valueChanged)
    }
    
    private func configureSegmentedControlLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        segmentControl.snp.makeConstraints { make in
            make.height.equalTo(safeArea).multipliedBy(0.2)
            make.top.leading.trailing.equalTo(safeArea)
        }
    }
    
}
