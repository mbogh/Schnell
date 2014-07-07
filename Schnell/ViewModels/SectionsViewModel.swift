//
//  SectionsViewModel.swift
//  Schnell
//
//  Created by Morten Bøgh on 07/06/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import Foundation
import SchnellKit

class SectionsViewModel {
    var sections = [RoadSection]()
    var isActivated = false
    
    func activate() {
        self.isActivated = true
        
        let reponseData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sections", ofType: "json"))
        let error: NSErrorPointer?
        
        if let response = NSJSONSerialization.JSONObjectWithData(reponseData, options: NSJSONReadingOptions(), error: error!) as? NSDictionary {
            if let result = response["result"] as? NSDictionary {
                if let records = result["records"] as? NSArray {
                    for (var i = 0; i < records.count; i++) {
                        let record = records[i] as NSDictionary
                        let roadSection = RoadSection(data:record)
                        sections.append(roadSection)
                    }
                }
            }
        }        
    }
}