//
//  SuffixViewController.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/29/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

private enum ArrayVCRow: Int {
    case creation = 0,
    sort,
    lookupByObject,
    lookupExisting,
    lookupSeveralTimes
}

import UIKit

class SuffixViewController: DataStructuresViewController {

    
    //MARK: - Dependencies
    var algoNames: [String]?
    var arrayManipulator: SuffixArrayManipulator!

    //MARK: - Variables
    var creationTime: TimeInterval = 0
    var sortTime: TimeInterval = 0
    //var lookupByIndexTime: TimeInterval = 0
    var lookupByObjectTime: TimeInterval = 0
    var lookupExistingObjects: TimeInterval = 0
    var lookupSeveralTimes: TimeInterval = 0
    var searches: Int = 1

    override var countLabelText: String {
        return "Number of searches:"
    }
    
    //MARK: - Methods
    
    //MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create Array and Test", for: [])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let sam = FileService.retrieve(String(describing: SuffixArrayModel.self), from: FileService.Directory.documents, as: SuffixArrayModel.self) {
            arrayManipulator.setupWithNames(names: algoNames ?? [])
            creationTime = sam.setupWithNames
            sortTime = sam.sortAscending
            lookupByObjectTime = sam.lookupStrings
            lookupExistingObjects = sam.lookupExistingStrings
            lookupSeveralTimes = sam.lookupSeveralTimes

            testOnlyButton.isEnabled = true
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard arrayManipulator.arrayHasObjects() else { return }
        let sam = SuffixArrayModel(setupWithNames: creationTime, sortAscending: sortTime, arrayHasObjects: false, lookupStrings: lookupByObjectTime, lookupExistingStrings: lookupExistingObjects, lookupSeveralTimes: lookupSeveralTimes)
        FileService.store(sam, to: FileService.Directory.documents, as: String(describing: SuffixArrayModel.self))
    }
    
    //MARK: Superclass creation/testing overrides

    override func create(_ size: Int) {
        creationTime = arrayManipulator.setupWithNames(names: algoNames ?? [])
        self.searches = size
    }
    
    override func test() {
        if (arrayManipulator.arrayHasObjects()) {
            sortTime = arrayManipulator.sortAscending()
            lookupByObjectTime = arrayManipulator.lookupStrings(count: 10, length: 3)
            lookupExistingObjects = arrayManipulator.lookupExistingStrings(count: 10)
            lookupSeveralTimes = arrayManipulator.lookupSeveralTimes(count: searches)
        } else {
            print("Array not set up yet!")
        }
    }
    
    //MARK: Table View Override
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        switch indexPath.row {
        case ArrayVCRow.creation.rawValue:
            cell.textLabel!.text = "Array Creation:"
            cell.detailTextLabel!.text = formattedTime(creationTime)
        case ArrayVCRow.sort.rawValue:
            cell.textLabel!.text = "Sort:"
            cell.detailTextLabel!.text = formattedTime(sortTime)
        case ArrayVCRow.lookupByObject.rawValue:
            cell.textLabel!.text = "Lookup By Random Object:"
            cell.detailTextLabel!.text = formattedTime(lookupByObjectTime)
        case ArrayVCRow.lookupExisting.rawValue:
            cell.textLabel!.text = "Lookup By Existing Object:"
            cell.detailTextLabel!.text = formattedTime(lookupExistingObjects)
        case ArrayVCRow.lookupSeveralTimes.rawValue:
            cell.textLabel!.text = "Lookup Several Times:"
            cell.detailTextLabel!.text = formattedTime(lookupSeveralTimes)
        default:
            cell.textLabel!.text = ""
            cell.detailTextLabel!.text = ""
            //print("Unhandled row! \(indexPath.row)")
        }
        
        return cell
    }
}

