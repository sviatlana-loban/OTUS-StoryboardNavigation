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

    var viewModel: BenchmarkViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addBehaviors(behaviors: [DateTimerBehavior( startBlock: { [unowned self] in
            self.collectionView.reloadData()
            }, endBlock: { [unowned self] in self.viewModel.killTimers() } )])
    }

    private func bind() {
        let sl = ServiceLocator.shared
        let viewModel = BenchmarkViewModel(timerProvider: sl.getService()!)
        self.viewModel = viewModel
    }
    
    func updateChartTapped(at index: IndexPath) {
        viewModel.updateChartTapped(at: index.item)
    }
    
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension BenchmarkViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfTimers()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenchmarkCollectionViewCell.reuseId, for: indexPath) as? BenchmarkCollectionViewCell else {
            fatalError("Wrong cell")
        }
        cell.delegate = self
        cell.index = indexPath
        
        let timerInfo = viewModel.getTimerInfo(at: indexPath.item)
        cell.update(text: timerInfo.text, runValue: timerInfo.runValue, stopValue: timerInfo.stopValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.timerSelected(at: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}
