//
//  SectionsViewModel.swift
//  Schnell
//
//  Created by Morten Bøgh on 07/06/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import Foundation

class SectionsViewModel {
    var sections = []
    var isActivated = false
    
    func activate() {
        self.isActivated = true
        // Download stuff.
    }
}