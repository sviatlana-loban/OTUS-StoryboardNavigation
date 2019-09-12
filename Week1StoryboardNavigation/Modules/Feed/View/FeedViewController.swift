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

    var viewModel: FeedViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
    }

    private func bind() {
        let sl = ServiceLocator.shared
        let viewModel = FeedViewModel(dataProvider: sl.getService()!, algoProvider: sl.getService()!, arrayManipulator: sl.getService()!)
        self.viewModel = viewModel
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
        var pushViewController: UIViewController?
        let text = viewModel.getRowTitle(at: indexPath.row)
        
        if text == "SuffixArray" {
            pushViewController = storyboard.instantiateViewController(withIdentifier: "SuffixViewController")
            (pushViewController as? SuffixViewController)?.algoNames = viewModel.algoNames
            (pushViewController as? SuffixViewController)?.arrayManipulator = viewModel.arrayManipulator
        } else {
            guard let sessionSummary = storyboard.instantiateViewController(withIdentifier: "SessionSummaryViewController") as? SessionSummaryViewController else {
                return
            }
            sessionSummary.text = text
            pushViewController = sessionSummary
        }
        
        if let pushViewController = pushViewController {
            self.navigationController?.pushViewController(pushViewController, animated: true)
        }
        
    }
    
}
