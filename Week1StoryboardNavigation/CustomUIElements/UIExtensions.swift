//
//  Extensions.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/26/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit
import Foundation

extension CGFloat {
    var radiansToDegrees: CGFloat {
        return self * 180 / .pi
    }
}

extension CGPoint {
    init(center: CGPoint, radius: CGFloat, degrees: CGFloat) {
        self.init(x: cos(degrees) * radius + center.x,
                  y: sin(degrees) * radius + center.y)
    }
    
    func projected(by value: CGFloat, angle: CGFloat) -> CGPoint {
        return CGPoint(
            x: x + value * cos(angle), y: y + value * sin(angle)
        )
    }
}

extension CGRect {
    init(centeredOn center: CGPoint, size: CGSize) {
        self.init(
            origin: CGPoint(
                x: center.x - size.width * 0.5, y: center.y - size.height * 0.5
            ),
            size: size
        )
    }
    var center: CGPoint {
        return CGPoint(x: width / 2 + origin.x,
                       y: height / 2 + origin.y)
    }
}

extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.5
    }
}


extension UIViewController {
    func topMostViewController() -> UIViewController? {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController()
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController!.topMostViewController()
    }
}

extension UIApplication {
    func topMostViewController() -> UIViewController? {
        return self.keyWindow?.rootViewController?.topMostViewController()
    }
}

