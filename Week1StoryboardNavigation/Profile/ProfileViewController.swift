//
//  ProfileViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/10/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ScreenColorBehaviorProtocol {
    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate() //won't be called
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundColorBehavior = ScreenColorBehavior(with: UIColor.black)
        self.addBehaviors(behaviors: [backgroundColorBehavior])
    }

}
