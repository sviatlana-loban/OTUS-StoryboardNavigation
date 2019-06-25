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
        private var runSecondsCounter = 0
        private var stopSecondsCounter = 0
        private(set) var paused = true
        
        private(set) var viewRunSeconds = 0
        private(set) var viewStopSeconds = 0
        
        init() {}
        
        func pause() {
//            if paused {
//                timer = nil
//                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
//            } else {
//                timer?.invalidate()
//            }
            if timer == nil {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
            }
            paused = !paused
        }
        
        @objc private func runTimed() {
            if paused {
                stopSecondsCounter += 1
            } else {
                runSecondsCounter += 1
            }
        }
        
        func getTimerString() -> String? {
            guard let timer = timer else {
                return nil
            }
            let runMinutes = Int(runSecondsCounter) / 60 % 60
            let runSeconds = Int(runSecondsCounter) % 60
            
            let stopMinutes = Int(stopSecondsCounter) / 60 % 60
            let stopSeconds = Int(stopSecondsCounter) % 60
            
            return String(format: "run %02d:%02d stop %02d:%02d", runMinutes, runSeconds, stopMinutes, stopSeconds)
        }
        
        func getRunStopPercents() -> (runValue: Double, stopValue: Double) {
            let sum = viewRunSeconds + viewStopSeconds
            guard  sum != 0 else {
                return (0,0)
            }
            let runValue = Double(viewRunSeconds*100/sum)
            let stopValue = 100 - runValue
            return (runValue: runValue, stopValue: stopValue)
        }
        
        func updateRunStopPercents() {
            viewRunSeconds = runSecondsCounter
            viewStopSeconds = stopSecondsCounter
        }
        
        func kill() {
            timer?.invalidate()
            timer = nil
        }
    }
}
