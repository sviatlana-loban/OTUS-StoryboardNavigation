//
//  DateTimerBehavior.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/10/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit


final class DateTimerBehavior: ViewControllerLifecycleBehavior {
    
    private var timer: Timer?
    
    func afterAppearing(_ viewController: UIViewController) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        timer?.invalidate()
    }
    
    @objc private func runTimed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        print(dateFormatter.string(from: Date()))
    }
}
