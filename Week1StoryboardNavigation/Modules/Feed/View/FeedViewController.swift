//
//  FeedViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/17/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let reuseId = "feedReusableCell"

    weak var viewModel: FeedViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
    }

}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRowsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        cell.textLabel?.text = viewModel.getRowTitle(at: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Feed", bundle: nil)
        var sessionSummaryViewController: UIViewController?
        let text = viewModel.getRowTitle(at: indexPath.row)
        
        if text == "SuffixArray" {
            sessionSummaryViewController = storyboard.instantiateViewController(withIdentifier: "SuffixViewController")
        } else {
            guard let sessionSummary = storyboard.instantiateViewController(withIdentifier: "SessionSummaryViewController") as? SessionSummaryViewController else {
                return
            }
            sessionSummary.text = text
            sessionSummaryViewController = sessionSummary
        }
        
        if let pushViewController = sessionSummaryViewController {
            self.navigationController?.pushViewController(pushViewController, animated: true)
        }
        
    }
    
}
