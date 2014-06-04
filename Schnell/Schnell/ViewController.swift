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
        println(names)
        names = names.map{ name in name.lowercaseString }
        println(names)
        
        let numbers: Int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        println(numbers)
        let number = numbers.reduce(0){ previous, next in previous + next }
        println(number)
        
        var moreNumbers: Int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        println(moreNumbers)
        moreNumbers = moreNumbers.filter{ number in number % 2 == 0 }
        println(moreNumbers)
    }

}
