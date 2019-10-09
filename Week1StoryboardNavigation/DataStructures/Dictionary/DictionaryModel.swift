//
//  DictionaryModel.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

struct DictionaryModel: Codable {

    var dict = [Int: Int]()
    var dictHasEntries: Bool
    var setupWithEntryCount: TimeInterval
    var add1Entry: TimeInterval
    var add5Entries: TimeInterval
    var add10Entries: TimeInterval
    var remove1Entry: TimeInterval
    var remove5Entries: TimeInterval
    var remove10Entries: TimeInterval
    var lookup1EntryTime: TimeInterval
    var lookup10EntriesTime: TimeInterval
}
