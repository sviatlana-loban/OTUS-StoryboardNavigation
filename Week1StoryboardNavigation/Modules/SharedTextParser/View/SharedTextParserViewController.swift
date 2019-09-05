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

    weak var viewModel: SharedTextViewModel!

    @IBOutlet weak var sharedLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewIsReady()
    }


    @IBAction func segmentValueChanged(_ sender: Any) {
        viewModel.segmentValueChanged(with: segmentControl.selectedSegmentIndex)
    }

    func updateSharedLabel(with text: String) {
        sharedLabel.text = text
    }

}
