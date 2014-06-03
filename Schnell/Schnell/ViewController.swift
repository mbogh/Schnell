//
//  ViewController.swift
//  Schnell
//
//  Created by Morten Bøgh on 03/06/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var names: String[] = ["John", "Steve", "Tim"]
        println(names);
        names = names.map({ name in name.lowercaseString })
        println(names);
    }

}
