//
//  FeedViewControllerC.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/10/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class FeedViewControllerC: UIViewController {
    
    var shouldPopFeedB = false

    override func viewDidLoad() {
        super.viewDidLoad()

        if shouldPopFeedB {
            if let controllers = self.navigationController?.viewControllers {
                let newControllers = controllers.filter{ !($0 is FeedViewControllerB) }
                self.navigationController?.viewControllers = newControllers
            }
        }
    }


}
