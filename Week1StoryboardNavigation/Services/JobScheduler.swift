//
//  JobScheduler.swift
//  Week1StoryboardNavigation
//
//  Created by Sviatlana Loban on 10/3/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

class JobScheduler {

    private var jobs: [JobQueue] = []
    //var completion: (([JobQueue]) -> Void)?

    func appendQueue(_ queue: JobQueue) {
        jobs.append(queue)
    }

    func runJobs(completion: (([TimeInterval]) -> Void)? = nil) {
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "com.sloban.\(Date())", qos: .background)
        var timeIntervals = Array<TimeInterval>(repeating: 0.0, count: jobs.count)


        for i in 0 ..< jobs.count {
            timeIntervals[i] =
            Profiler.runClosureForTime { [weak self] in
                group.enter()
                print("\(self?.jobs[i]) entered")
                queue.async {
                    print(Thread.current)
                    self?.jobs[i].run()
                    group.leave()
                    print("\(self?.jobs[i]) left")
                }
                group.wait()
            }
        }
        completion?(timeIntervals)
    }
}
