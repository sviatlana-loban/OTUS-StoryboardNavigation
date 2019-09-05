//
//  SharedTextModel.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 9/5/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

enum Locales: String {
    case ru,en,fr,zh
}

final class SharedTextModel {

    let date = Date()
    let dfRu = DateFormatter()
    let locales: [Locales: Locale]
    var initialText: String = ""

    let dateReplacer: DateReplacer
    let measureReplacer: LengthMeasureReplacer

    init(dateReplacer: DateReplacer, measureReplacer: LengthMeasureReplacer) {
        let ru = Locale(identifier: "ru")
        let en = Locale(identifier: "en")
        let fr = Locale(identifier: "fr")
        let zh = Locale(identifier: "zh_CN")

        self.locales = [.ru: ru, .en: en, .fr: fr, .zh: zh]

        let temp = "yyyy.MM.dd G 'at' HH:mm:ss zzz"
        dfRu.setLocalizedDateFormatFromTemplate(temp)

        self.dateReplacer = dateReplacer
        self.measureReplacer = measureReplacer
    }

    func replaceLocalizable(toLocale: Locales) -> String {
        let dateText = replaceDate(in: initialText, toLocale: toLocale)
        let measureText = replaceMeasure(in: dateText, toLocale: toLocale)
        return measureText
    }

    private func replaceDate(in string: String, toLocale: Locales) -> String {
        guard let toLocale = locales[toLocale] else { return string}
        return dateReplacer.replaceDate(in: string, fromLocale: locales[.ru]!, toLocale: toLocale, regexPattern: DateRegex.russianDate.rawValue)
    }

    private func replaceMeasure(in string: String, toLocale: Locales) -> String {
        guard let toLocale = locales[toLocale] else { return string }
        let measureReplacer = LengthMeasureReplacer(toLocale: toLocale)
        return measureReplacer.replaceMeasure(in: string)
    }

}
