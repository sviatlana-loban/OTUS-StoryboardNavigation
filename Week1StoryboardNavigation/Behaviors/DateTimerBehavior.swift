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
    private var startBlock: (()->())?
    private var endBlock: (()->())?
    
    init(startBlock: (()->())?, endBlock: (()->())?) {
        self.startBlock = startBlock
        self.endBlock = endBlock
    }
    
    func afterAppearing(_ viewController: UIViewController) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        timer?.invalidate()
        if let block = endBlock {
            block()
        }
    }
    
    @objc private func runTimed() {
        if let block = startBlock {
            block()
        }
    }
}
