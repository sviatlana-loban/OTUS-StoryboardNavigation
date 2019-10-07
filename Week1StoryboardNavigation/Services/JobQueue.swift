//
//  JobQueue.swift
//  Week1StoryboardNavigation
//
//  Created by Sviatlana Loban on 10/3/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

class JobQueue {

    private var tasks: [()->()] = []

    func add(task: @escaping ()->()) {
        tasks.append(task)
    }

    func run() {
        for task in tasks {
            task()
        }
    }

}
