//
//  SuffixArrayManipulator.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/29/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class SuffixArrayManipulator {
    
    fileprivate var suffixArray = [(String, String)]()
    
    func setupWithNames(names: [String]) -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.suffixArray = [(String, String)]()
            for name in names {
                self.suffixArray.append(contentsOf: SuffixSequence(string: name))
            }
        }
    }
    
    func sortAscending() -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.suffixArray = self.suffixArray.sorted(by: {$0.0 < $1.0})
        }
    }
    
    func arrayHasObjects() -> Bool {
        if suffixArray.count == 0 {
            return false
        } else {
            return true
        }
    }
    
    func lookupStrings(count: Int, length: Int) -> TimeInterval {
        var objectsArray = [String]()
        
        let generator = StringGenerator()
        for _ in 0 ..< count {
            objectsArray.append(generator.generateRandomString(length))
        }
        
        //measure how long it takes to find them
        let timed =  Profiler.runClosureForTime() {
            for findMe in objectsArray {
                let _ = self.suffixArray.firstIndex(where: {$0.0 == findMe})
            }
        }
        return timed
    }
    
    func lookupExistingStrings(count: Int) -> TimeInterval {
        var objectsArray = [String]()
        
        for _ in 0 ..< count {
            objectsArray.append(suffixArray[Int.random(in: 0..<suffixArray.count)].0)
        }
        
        //measure how long it takes to find them
        let timed =  Profiler.runClosureForTime() {
            for findMe in objectsArray {
                let _ = self.suffixArray.firstIndex(where: {$0.0 == findMe})
            }
        }
        return timed
    }    
    
}

