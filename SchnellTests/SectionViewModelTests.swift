//
//  SectionViewModelTests.swift
//  Schnell
//
//  Created by Morten Bøgh on 07/06/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import XCTest

class SectionViewModelTests: XCTestCase {
    let viewModel = SectionsViewModel()
    
    func testViewModelShouldBeActivatedAfterCallingActivate() {
        viewModel.activate()
        XCTAssertTrue(viewModel.isActivated, "Should not be activated")
    }
    
    func testViewModelShouldBeNotHaveBeenActivatedAfterInit() {
        XCTAssertFalse(viewModel.isActivated, "Should be activated")
    }
    
    func testViewModelSectionsShouldBeEmptyAfterInit() {
        XCTAssertTrue(viewModel.sections.count == 0, "Should be an empty array")
    }
}
