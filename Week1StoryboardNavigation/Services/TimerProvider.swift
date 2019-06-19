//
//  TimerProvider.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/18/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class TimerProvider {
    
    private(set) var timers: [PausableTimer]
    
    init(count: Int) {
        timers = [PausableTimer].init()
        for _ in 0..<count {
            timers.append(PausableTimer())
        }
    }
    
    class PausableTimer {
        
        private var timer: Timer?
        private var secondsCounter = 0
        private(set) var paused = true
        
        init() {}
        
        func pause() {
            if var timer = timer {
                if paused {
                    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
                } else {
                    timer.invalidate()
                }
                paused = !paused
            } else {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
                paused = false
            }
        }
        
        @objc private func runTimed() {
            secondsCounter += 1
        }
        
        func getTimerString() -> String? {
            guard let timer = timer else {
                return nil
            }
            let hours = Int(secondsCounter) / 3600
            let minutes = Int(secondsCounter) / 60 % 60
            let seconds = Int(secondsCounter) % 60
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        }
        
        func kill() {
            timer?.invalidate()
            timer = nil
        }
    }
}
