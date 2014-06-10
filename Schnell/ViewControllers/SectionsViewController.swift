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
        cell.addressLabel.text = "Skanderborgvej 127 - 204"
        cell.zipcodeCityLabel.text = "8260 Aarhus N"
        return cell
    }
    
    // #pragma mark - UITableViewDelegate
}