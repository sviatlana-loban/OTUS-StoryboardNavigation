//
//  BenchmarkViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/10/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class BenchmarkViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource = Services.timerProvider.timers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(StagLayout(widthHeightRatios: [(1.0, 1.0), (0.5, 0.5), (0.5, 0.5)], itemSpacing: 4), animated: true)
        
        addBehaviors(behaviors: [DateTimerBehavior( { [unowned self] in
            self.collectionView.reloadData()
        } )])
    }
    
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension BenchmarkViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenchmarkCollectionViewCell.reuseId, for: indexPath) as? BenchmarkCollectionViewCell else {
            fatalError("Wrong cell")
        }
        let itemTimer = dataSource[indexPath.item]
        let image = UIImage(named: "timer") ?? UIImage()
        cell.update(text: itemTimer.getTimerString() ?? "not started", image: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataSource[indexPath.item].pause()
    }
}
