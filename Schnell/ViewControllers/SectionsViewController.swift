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
    }

    // #pragma mark - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.sections.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SectionCell") as UITableViewCell

        return cell
    }
}
