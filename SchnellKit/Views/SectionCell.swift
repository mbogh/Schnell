//
//  SectionCell.swift
//  Schnell
//
//  Created by Morten Bøgh on 08/06/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import UIKit

class SectionCell: UITableViewCell {
    @IBOutlet var addressLabel: UILabel
    @IBOutlet var zipcodeCityLabel: UILabel
    
    
    
    class func estimatedHeight() -> CGFloat {
        return 60
    }
}
