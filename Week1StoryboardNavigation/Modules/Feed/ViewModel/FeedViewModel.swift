//
//  FeedViewModel.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 9/5/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class FeedViewModel {

    private let items: [String]
    let algoNames: [String]
    let arrayManipulator: SuffixArrayManipulator
    let view: FeedViewController

    init(view: FeedViewController, dataProvider: DataProvider, algoProvider: AlgoProvider, arrayManipulator: SuffixArrayManipulator) {
        self.items = dataProvider.data
        self.algoNames = algoProvider.all
        self.arrayManipulator = arrayManipulator
        self.view = view
    }

    func getRowsCount() -> Int {
        return items.count
    }

    func getRowTitle(at index: Int) -> String {
        return items[index]
    }
}
