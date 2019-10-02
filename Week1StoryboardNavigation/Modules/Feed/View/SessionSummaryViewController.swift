//
//  SessionSummaryViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/17/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class SessionSummaryViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var text: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
    }

}
