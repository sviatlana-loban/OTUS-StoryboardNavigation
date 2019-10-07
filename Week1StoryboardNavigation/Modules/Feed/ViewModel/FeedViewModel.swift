//
//  FeedViewModel.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 9/5/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class FeedViewModel {

    weak var view: FeedViewController?
    private let items: [String]
    let algoNames: [String]
    let arrayManipulator: SuffixArrayManipulator
    var timeIntervals: [TimeInterval]?

    var capacity: Int
    var count: Int

    init(dataProvider: DataProvider, algoProvider: AlgoProvider, arrayManipulator: SuffixArrayManipulator) {
        self.items = dataProvider.data
        self.algoNames = algoProvider.all
        self.arrayManipulator = arrayManipulator

        self.capacity = 10
        self.count = 10000
    }

    func getRowsCount() -> Int {
        return items.count
    }

    func getRowTitle(at index: Int) -> String {
        return items[index]
    }

    func runJobsButtonTapped() {
        print("hide \(Thread.current)")
        self.view?.startSpinner()
        self.view?.sliderValueLabel.isEnabled = false
        self.view?.slider.isEnabled = false

        self.runTests()
        print("hide 1 \(Thread.current)")

    }

    func sliderValueChanged(with value: Float) {
        self.capacity = Int(value)
        view?.updateSliderValueLavel(with: "Container capacity: \(capacity)")
    }

    func runTests() {
        let count = self.count
        let capacity = self.capacity
        let arrayJobQueue = JobQueue()
        let setJobQueue = JobQueue()
        let dictionaryQueue = JobQueue()
        let suffixQueue = JobQueue()

        for _ in 0..<count {
            arrayJobQueue.add(task: {
                let manipulator = SwiftArrayManipulator()
                manipulator.setupWithObjectCount(capacity)
            })

            setJobQueue.add(task: {
                let manipulator = SwiftSetManipulator()
                manipulator.setupWithObjectCount(capacity)
            })

            dictionaryQueue.add(task: {
                let manipulator = SwiftSetManipulator()
                manipulator.setupWithObjectCount(capacity)
            })

            dictionaryQueue.add(task: {
                let manipulator = SuffixArrayManipulator()
                manipulator.setupWithNames(names: self.algoNames)
            })
        }


        let scheduler = JobScheduler()
        scheduler.appendQueue(arrayJobQueue)
        scheduler.appendQueue(setJobQueue)
        scheduler.appendQueue(dictionaryQueue)
        scheduler.appendQueue(suffixQueue)

        scheduler.runJobs { [weak self]
            intervals in
            self?.timeIntervals = intervals
            DispatchQueue.main.async { [weak self] in
                self?.view?.stopSpinner()
                self?.view?.sliderValueLabel.isEnabled = true
                self?.view?.slider.isEnabled = true
            }
            self?.configureTimeStrings()
        }
    }

    func configureTimeStrings() {
        var timeStrings = ["Array: ","Set: ","Dictionary: ","SuffixArray: "]
        guard let timeIntervals = timeIntervals else {return}
        for i in 0 ..< timeStrings.count {
            timeStrings[i] += ("\(timeIntervals[i].secondsString)")
        }
        view?.updateLabels(with: timeStrings)
    }
}

extension TimeInterval {
    var secondsString: String {
        return String(format: "%3.4f", arguments: [self])
    }
}
