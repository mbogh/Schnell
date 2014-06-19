//
//  SectionsViewController.swift
//  Schnell
//
//  Created by Morten Bøgh on 05/06/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import UIKit

class SectionsViewController: UITableViewController {
    var viewModel = SectionsViewModel()
    var favoriteSections = Int[]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = SectionCell.estimatedHeight()
        
        viewModel.activate()
        self.tableView.reloadData()
    }

    // #pragma mark - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.sections.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SectionCell") as SectionCell
        
        let roadSection = self.viewModel.sections[indexPath.row]
        
        cell.addressLabel.text = roadSection.name
        cell.zipcodeCityLabel.text = roadSection.zipcodeCity
        
        if contains(favoriteSections, roadSection.id) {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    // #pragma mark - UITableViewDelegate
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let roadSection = self.viewModel.sections[indexPath.row]
        if let index = find(favoriteSections, roadSection.id) {
            favoriteSections.removeAtIndex(index)
        }
        else {
            favoriteSections.append(roadSection.id)
        }
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
