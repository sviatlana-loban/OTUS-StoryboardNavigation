//
//  DateAndMeasureReplacer.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 7/28/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class LengthMeasureReplacer {

    func replaceMeasure(in text: String, toLocale: Locale) -> String {
        var resultText = text
        let matchedResults = findMeasures(in: text)

        let toMeasurementFormatter = MeasurementFormatter()
        toMeasurementFormatter.locale = toLocale

        for result in matchedResults {
            for i in (0..<result.ranges.count).reversed() {
                guard let range = Range(result.ranges[i], in: text) else { continue } // next iteration

                let smallString = String(text[range])
                let digitString = smallString.components(separatedBy: CharacterSet(charactersIn: "0123456789,.").inverted).joined(separator: "")
                if let value = Double(digitString) {

                    let fromMeasurement = Measurement(value: value, unit: result.unit.unitValue)
                    let newValue = toMeasurementFormatter.string(from: fromMeasurement)
                    resultText.replaceSubrange(range, with: newValue)
                }
            }
        }
        return resultText
    }

    func findMeasures(in text: String) -> [(ranges: [NSRange], unit: LengthRegexs)] {
        var result = [([NSRange], LengthRegexs)]()
        for pattern in LengthRegexs.allCases {
            let matched = text.matches(for: pattern.rawValue)
            result.append((matched, pattern))
        }
        return result
    }

    enum LengthRegexs: String, CaseIterable {
        case micrometers = #"[0-9]*(\.|,)?[0-9]*(\s)?(микрометра|микрометров|мкм)"#
        case millimeters = #"[0-9]*(\.|,)?[0-9]*(\s)?(миллиметра|миллиметров|мм)"#
        case centimeters = #"[0-9]*(\.|,)?[0-9]*(\s)?(сантиметра|сантиметров|см)"#
        case decimeters = #"[0-9]*(\.|,)?[0-9]*(\s)?(дециметра|дециметров|дм)"#
        case meters = #"[0-9]*(\.|,)?[0-9]*(\s)?(метра|метров|м)"#
        case kilometers = #"[0-9]*(\.|,)?[0-9]*(\s)?(километра|километров|км)"#

        var unitValue: UnitLength {
            switch self {
            case .micrometers:
                return UnitLength.micrometers
            case .millimeters:
                return UnitLength.millimeters
            case .centimeters:
                return UnitLength.centimeters
            case .decimeters:
                return UnitLength.decimeters
            case .meters:
                return UnitLength.meters
            case .kilometers:
                return UnitLength.kilometers
            }
        }
    }
}

