//
//  DataProvider.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/17/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class DataProvider {
    
    private(set) var data: [String]
    
    init(count: Int) {
        data = [String].init()
        data.append("Array")
        data.append("Set")
        data.append("Dictionary")
        data.append("SuffixArray")
        for i in 4..<count {
            data.append("Item \(i)")
        }
    }
}
