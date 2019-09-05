//
//  SharedTextViewModel.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 9/5/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import Foundation

final class SharedTextViewModel {

    let view: SharedTextParserViewController
    let model: SharedTextModel


    init(view: SharedTextParserViewController, model: SharedTextModel) {
        self.view = view
        self.model = model
    }

    func viewIsReady() {
        if let ud = UserDefaults(suiteName: "group.ShareText.Otus"), let text = ud.string(forKey: "text") {
            model.initialText = text
            view.updateSharedLabel(with: text)
        }
    }

    func segmentValueChanged(with value: Int) {
        switch value {
        case 0:
            let text = model.replaceLocalizable(toLocale: .en)
            view.updateSharedLabel(with: text)
        case 1:
            let text = model.replaceLocalizable(toLocale: .fr)
            view.updateSharedLabel(with: text)
        case 2:
            let text = model.replaceLocalizable(toLocale: .zh)
            view.updateSharedLabel(with: text)
        default:
            view.updateSharedLabel(with: model.initialText)
        }
    }

}
