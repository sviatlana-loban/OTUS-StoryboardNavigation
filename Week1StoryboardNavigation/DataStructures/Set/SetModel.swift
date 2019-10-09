//
//  SetModel.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

struct SetModel: Codable {

    var setToManipulate = Set<String>()
    var setHasObjects: Bool
    var setupWithObjectCount: TimeInterval
    var add1Object: TimeInterval
    var add5Objects: TimeInterval
    var add10Objects: TimeInterval
    var remove1Object: TimeInterval
    var remove5Objects: TimeInterval
    var remove10Objects: TimeInterval
    var lookup1Object: TimeInterval
    var lookup10Objects: TimeInterval
}
