//
//  ColoredSplitViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/11/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class ColoredSplitViewController: UISplitViewController, ScreenColorBehaviorProtocol {
    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate() //will be called
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
}
