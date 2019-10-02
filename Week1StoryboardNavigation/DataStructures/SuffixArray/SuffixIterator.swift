//
//  SuffixIterator.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/29/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

struct SuffixIterator: IteratorProtocol {
    
    let originalString: String
    let string: String
    let last: String.Index
    var offset: String.Index
    
    init(string: String) {
        self.originalString = string
        self.string = string
        last = string.endIndex
        offset = string.startIndex
    }
    
    mutating func next() -> (String, String)? {
        guard offset < last else {
            return (nil)
        }
        let substring = string[offset..<last]
        string.formIndex(after: &offset)
        return (String(substring), originalString)
    }
}

struct SuffixSequence: Sequence {

    var string: String
    
    init(string: String) {
        self.string = string
    }
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string: string)
    }

}
