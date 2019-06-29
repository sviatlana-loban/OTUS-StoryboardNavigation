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
    lookupExisting
}

import UIKit

class SuffixViewController: DataStructuresViewController {
    
    //MARK: - Variables
    let algoNames = Services.algoProvider.all
    let arrayManipulator = SuffixArrayManipulator()
    
    var creationTime: TimeInterval = 0
    var sortTime: TimeInterval = 0
    var lookupByIndexTime: TimeInterval = 0
    var lookupByObjectTime: TimeInterval = 0
    var lookupExistingObjects: TimeInterval = 0
    
    //MARK: - Methods
    
    //MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create Array and Test", for: [])
    }
    
    //MARK: Superclass creation/testing overrides
    
    override func create(_ size: Int) {
        creationTime = arrayManipulator.setupWithNames(names: algoNames)
    }
    
    override func test() {
        if (arrayManipulator.arrayHasObjects()) {
            sortTime = arrayManipulator.sortAscending()
            lookupByObjectTime = arrayManipulator.lookupStrings(count: 10, length: 3)
            lookupExistingObjects = arrayManipulator.lookupExistingStrings(count: 10)
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
        default:
            print("Unhandled row! \(indexPath.row)")
        }
        
        return cell
    }
}

