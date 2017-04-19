//
//  ViewController.swift
//  ios-carbonkit-demo
//
//  Created by Kushida　Eiji on 2017/04/18.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import CarbonKit

enum ViewControllerType: Int {
    case first
    case second
    case third

    /// Storyboard IDを取得する
    ///
    /// - Returns: Storyboard ID
    func identifier() -> String {

        switch self {
        case .first:
            return FirstViewController.identifier

        case .second:
            return SecondViewController.identifier

        case .third:
            return ThirdViewControlller.identifier
        }
    }
}

final class ViewController: UIViewController {

    var items = ["1st","2nd","3rd"]
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        setupNavigationStyle()
        setupTab()
    }

    /// ナビゲーションバーを設定する
    private func setupNavigationStyle() {

        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items,
                                                            delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)

        carbonTabSwipeNavigation.setIndicatorColor(UIColor.blue)
        carbonTabSwipeNavigation.currentTabIndex = 0

        carbonTabSwipeNavigation.setNormalColor(UIColor.black,
                                                font: UIFont.boldSystemFont(ofSize: 14))
        carbonTabSwipeNavigation.setSelectedColor(UIColor.blue,
                                                  font: UIFont.boldSystemFont(ofSize: 14))
    }

    /// タブの幅を設定する
    private func setupTab() {

        let tabWidth = UIScreen.main.bounds.size.width / CGFloat(items.count)

        for (i,_) in items.enumerated() {

            if let segmentControl = carbonTabSwipeNavigation.carbonSegmentedControl {
                segmentControl.setWidth(tabWidth,forSegmentAt: i)
            }
        }
    }
}

// MARK: - CarbonTabSwipeNavigationDelegate
extension ViewController: CarbonTabSwipeNavigationDelegate {
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation,
                                  viewControllerAt index: UInt) -> UIViewController {

        let storyboardID = viewControllerType(index: index).identifier()

        if let vc = self.storyboard?
            .instantiateViewController(withIdentifier: storyboardID) {
            return vc
        }
        fatalError("unwap storyboard")
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation,
                                  didMoveAt index: UInt) {
        
        self.title = items[Int(index)]
    }

    /// indexとViewControllerTypeをマッピングする
    ///
    /// - Parameter index: index
    /// - Returns: ViewControllerType
    private func viewControllerType(index: UInt) -> ViewControllerType{

        let types: [ViewControllerType] = [.first, .second, .third]
        return types[Int(index)]
    }
}
