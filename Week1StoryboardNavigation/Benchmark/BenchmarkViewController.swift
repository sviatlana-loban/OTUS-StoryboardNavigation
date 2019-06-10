//
//  BenchmarkViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/10/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class BenchmarkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBehaviors(behaviors: [DateTimerBehavior()])
    }
    

}
