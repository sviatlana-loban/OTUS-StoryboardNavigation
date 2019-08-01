//
//  SharedTextParserViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit
import Foundation

class SharedTextParserViewController: UIViewController {

    let temp = "yyyy.MM.dd G 'at' HH:mm:ss zzz"
    let date = Date()
    let dfRu = DateFormatter()

    let ru = Locale(identifier: "ru")
    let en = Locale(identifier: "en")
    let fr = Locale(identifier: "fr")
    let zh = Locale(identifier: "zh_CN")

    var sharedText: String = ""
    @IBOutlet weak var sharedLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let ud = UserDefaults(suiteName: "group.ShareText.Otus"), let text = ud.string(forKey: "text") {
            sharedText = text
        }

        updateSharedLabel()
    }


    @IBAction func segmentValueChanged(_ sender: Any) {
        updateSharedLabel()
    }

    private func updateSharedLabel() {
        dfRu.setLocalizedDateFormatFromTemplate(temp)

        switch segmentControl.selectedSegmentIndex {
        case 0:
            let dateText = replaceDate(in: sharedText, toLocale: en)
            let measureText = replaceMeasure(in: dateText, toLocale: en)
            sharedLabel.text = measureText
        case 1:
            let dateText = replaceDate(in: sharedText, toLocale: fr)
            let measureText = replaceMeasure(in: dateText, toLocale: fr)
            sharedLabel.text = measureText
        case 2:
            let dateText = replaceDate(in: sharedText, toLocale: zh)
            let measureText = replaceMeasure(in: dateText, toLocale: zh)
            sharedLabel.text = measureText
        default:
            sharedLabel.text = sharedText
        }
    }

    private func replaceDate(in string: String, toLocale: Locale) -> String {
        let dateReplacer = DateReplacer(fromLocale: ru, toLocale: toLocale, regexPattern: DateRegex.russianDate.rawValue)
        return dateReplacer.replaceDate(in: string)
    }

    private func replaceMeasure(in string: String, toLocale: Locale) -> String {
        let measureReplacer = LengthMeasureReplacer(toLocale: toLocale)
        return measureReplacer.replaceMeasure(in: string)
    }
}
