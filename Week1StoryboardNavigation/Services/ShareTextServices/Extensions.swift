//
//  Extensions.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 7/30/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

extension String {
    func matches(for regex: String) -> [NSRange] {

        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.map{ $0.range }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
