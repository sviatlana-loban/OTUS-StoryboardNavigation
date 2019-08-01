//
//  DateReplacer.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 7/30/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class DateReplacer {
    let fromLocale: Locale
    let toLocale: Locale

    private let fromDateFormatter: DateFormatter
    private let toDateFormatter: DateFormatter

    private let dateRegex: String//

    init(fromLocale: Locale, toLocale: Locale, regexPattern: String) {
        self.fromLocale = fromLocale
        self.toLocale = toLocale

        let dateFormat = "dd MMMM yyyy"
        self.fromDateFormatter = DateFormatter()
        self.fromDateFormatter.locale = fromLocale
        self.fromDateFormatter.dateFormat = dateFormat

        self.toDateFormatter = DateFormatter()
        self.toDateFormatter.locale = toLocale
        self.toDateFormatter.dateFormat = dateFormat

        self.dateRegex = regexPattern
    }

    func replaceDate(in text: String) -> String {
        var resultText = text
        let dates = text.matches(for: dateRegex)
        for i in (0..<dates.count).reversed() {
            let dateRange = dates[i]
            if let range = Range(dateRange, in: text), let fromDate = fromDateFormatter.date(from: String(text[range])) {
                let toDate = toDateFormatter.string(from: fromDate)
                resultText.replaceSubrange(range, with: toDate)
            }
        }
        return resultText
    }
}

enum DateRegex: String {
    case russianDate = #"[0-9]{1,2}\ ((я|Я)нваря|(ф|Ф)евраля|(м|М)арта|(а|А)преля|(м|М)ая|(и|И)юня|(и|И)юля|(а|А)вгуста|(с|С)ентября|(о|О)ктября|(н|Н)оября|(д|Д)екабря) ([0-9]{4}|[0-9]{2})"#
}
