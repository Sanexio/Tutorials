//
//  DetailViewController.swift
//  UISplitViewBeispiel
//
//  Created by Jan Brinkmann on 15/06/15.
//  Copyright (c) 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
    }
}
