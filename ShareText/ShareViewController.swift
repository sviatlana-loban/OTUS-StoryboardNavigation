//
//  ShareViewController.swift
//  ShareText
//
//  Created by Admin on 7/22/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        guard let text = textView.text else {return}

        for item: Any in extensionContext!.inputItems {
            if let inputItem = item as? NSExtensionItem {
                for _: Any in inputItem.attachments! {
                    if let ud = UserDefaults(suiteName: "group.ShareText.Otus") {
                        ud.set(text, forKey: "text")
                    }
                }
            }
        }

        let url = URL(string: "ShareText://text")
        if let url = url {
            openURL(url)
        }

        dismiss(animated: false) {
            self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
        }
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

    @objc func openURL(_ url: URL) -> Bool {
        var responder: UIResponder? = self
        while responder != nil {
            if let app = responder as? UIApplication {
                return app.perform(#selector(openURL(_:)), with: url) != nil
            }
            responder = responder?.next
        }
        return false
    }

}
