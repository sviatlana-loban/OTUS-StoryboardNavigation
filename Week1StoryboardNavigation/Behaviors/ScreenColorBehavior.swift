//
//  ScreenColorBehavior.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/10/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit


final class ScreenColorBehavior: ViewControllerLifecycleBehavior {
    
    private let backgroundColor: UIColor
    
    init(with backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
    }
    
    func beforeAppearing(_ viewController: UIViewController) {
        viewController.view.backgroundColor = backgroundColor
        viewController.tabBarController?.tabBar.barStyle = .black
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        viewController.tabBarController?.tabBar.barStyle = .default
    }

}

