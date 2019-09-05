//
//  FeedViewModel.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 9/5/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class FeedViewModel {
    let items: [String]

    init(dataProvider: DataProvider) {
        self.items = dataProvider.data
    }

    func getRowsCount() -> Int {
        return items.count
    }

    func getRowTitle(at index: Int) -> String {
        return items[index]
    }
}
