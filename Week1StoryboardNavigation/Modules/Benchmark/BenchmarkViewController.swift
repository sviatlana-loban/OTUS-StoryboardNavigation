//
//  BenchmarkViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/10/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

class BenchmarkViewController: UIViewController, BenchmarkCellDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource = Services.timerProvider.timers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addBehaviors(behaviors: [DateTimerBehavior( startBlock: { [unowned self] in
            self.collectionView.reloadData()
            }, endBlock: { [unowned self] in self.dataSource.forEach{$0.kill()} } )])
    }
    
    func updateChartTapped(at index: IndexPath) {
        dataSource[index.item].updateRunStopPercents()
    }
    
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension BenchmarkViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenchmarkCollectionViewCell.reuseId, for: indexPath) as? BenchmarkCollectionViewCell else {
            fatalError("Wrong cell")
        }
        cell.delegate = self
        cell.index = indexPath
        
        let itemTimer = dataSource[indexPath.item]
        let timerValues = itemTimer.getRunStopPercents()
        cell.update(text: itemTimer.getTimerString() ?? "not started", runValue: timerValues.runValue, stopValue: timerValues.stopValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataSource[indexPath.item].pause()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}
