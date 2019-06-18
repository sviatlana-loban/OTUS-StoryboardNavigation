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
    let dataSource = Services.dataProvider.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseId) {
            cell.textLabel?.text = dataSource[index]
            return cell
        } else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: reuseId)
            cell.textLabel?.text = dataSource[index]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sessionSummaryViewController = storyboard.instantiateViewController(withIdentifier: "SessionSummaryViewController") as? SessionSummaryViewController else {
            return
        }
        
        sessionSummaryViewController.text = dataSource[indexPath.row]
        self.navigationController?.pushViewController(sessionSummaryViewController, animated: true)
    }
    
}
