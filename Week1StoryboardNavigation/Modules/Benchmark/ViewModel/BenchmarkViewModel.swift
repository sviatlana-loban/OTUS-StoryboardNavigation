//
//  BenchmarkViewModel.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 9/5/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class BenchmarkViewModel {

    let timers: [TimerProvider.PausableTimer]

    init(timerProvider: TimerProvider) {
        self.timers = timerProvider.timers
    }

    func getNumberOfTimers() -> Int {
        return timers.count
    }

    func getTimerInfo(at index: Int) -> (text: String, runValue: Double, stopValue: Double) {
        let itemTimer = timers[index]
        let timerValues = itemTimer.getRunStopPercents()
        return (text: itemTimer.getTimerString() ?? "not started", runValue: timerValues.runValue, stopValue: timerValues.stopValue)
    }

    func timerSelected(at index: Int) {
        timers[index].pause()
    }

    func updateChartTapped(at index: Int) {
        timers[index].updateRunStopPercents()
    }

    func killTimers() {
        timers.forEach{ $0.kill() }
    }
}
