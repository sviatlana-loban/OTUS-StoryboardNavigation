//
//  ScreenColorBehavior.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/10/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit


protocol ScreenColorBehaviorProtocol: class {
    var statusBarStyle: UIStatusBarStyle {get set}
}

final class ScreenColorBehavior: ViewControllerLifecycleBehavior {
    
    private let backgroundColor: UIColor
    
    init(with backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
    }
    
    func beforeAppearing(_ viewController: UIViewController) {
        viewController.view.backgroundColor = backgroundColor

        viewController.navigationController?.navigationBar.barStyle = .black
        viewController.tabBarController?.tabBar.barStyle = .black
        
        //if let statusBarHoldingViewController = UIApplication.shared.keyWindow?.rootViewController as? ScreenColorBehaviorProtocol { // what is right?
        if let statusBarHoldingViewController = viewController.splitViewController as? ScreenColorBehaviorProtocol {
            statusBarHoldingViewController.statusBarStyle = .lightContent
        }
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        viewController.navigationController?.navigationBar.barStyle = .default
        viewController.tabBarController?.tabBar.barStyle = .default
        
        if let screenColorViewController = UIApplication.shared.keyWindow?.rootViewController as? ScreenColorBehaviorProtocol {
            screenColorViewController.statusBarStyle = .default
        }
    }

}

