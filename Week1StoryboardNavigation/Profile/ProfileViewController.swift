//
//  ProfileViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/10/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundColorBehavior = ScreenColorBehavior(with: UIColor.black)
        self.addBehaviors(behaviors: [backgroundColorBehavior])
    }

}
