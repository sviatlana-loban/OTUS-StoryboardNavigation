//
//  ArrayModel.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

struct ArrayModel: Codable {

    var array = [Int]()
    var arrayHasObjects: Bool
    var setupWithObjectCount: TimeInterval
    var insertNewObjectAtBeginning: TimeInterval
    var insertNewObjectInMiddle: TimeInterval
    var addNewObjectAtEnd: TimeInterval
    var removeFirstObject: TimeInterval
    var removeMiddleObject: TimeInterval
    var removeLastObject: TimeInterval
    var lookupByIndex: TimeInterval
    var lookupByObject: TimeInterval
}
