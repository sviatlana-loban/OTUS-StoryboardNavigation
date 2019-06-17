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
        data = [String].init(repeating: "", count: count)
        for i in 0..<count {
            data[i] = "Item \(i)"
        }
    }
}
