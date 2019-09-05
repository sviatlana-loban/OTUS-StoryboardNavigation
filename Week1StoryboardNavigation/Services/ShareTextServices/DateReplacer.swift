//
//  DateReplacer.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 7/30/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class DateReplacer {

    func replaceDate(in text: String, fromLocale: Locale, toLocale: Locale, regexPattern: String) -> String {

        let dateFormat = "dd MMMM yyyy"
        let fromDateFormatter = DateFormatter()
        fromDateFormatter.locale = fromLocale
        fromDateFormatter.dateFormat = dateFormat

        let toDateFormatter = DateFormatter()
        toDateFormatter.locale = toLocale
        toDateFormatter.dateFormat = dateFormat

        var resultText = text
        let dates = text.matches(for: regexPattern)
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
