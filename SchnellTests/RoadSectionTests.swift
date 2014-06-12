//
//  RoadSectionTests.swift
//  Schnell
//
//  Created by Morten Bøgh on 12/06/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import XCTest

class RoadSectionTests: XCTestCase {
    
    func testSameStreetInOrderStreetNumbers() {
        let data = NSDictionary(objects: [165, "Test Road", "1", "Test Road", "42"], forKeys:["_id", "POINT_1_STREET", "POINT_1_STREET_NUMBER", "POINT_2_STREET", "POINT_2_STREET_NUMBER"])
        let roadSection = RoadSection(data: data)
        
        XCTAssertEqual(roadSection.name, "Test Road 1 - 42", "Street name should only be there once when it is the same street.")
    }
    
    func testSameStreetNotInOrderStreetNumbers() {
        let data = NSDictionary(objects: [165, "Test Road", "42", "Test Road", "1"], forKeys:["_id", "POINT_1_STREET", "POINT_1_STREET_NUMBER", "POINT_2_STREET", "POINT_2_STREET_NUMBER"])
        let roadSection = RoadSection(data: data)
        
        XCTAssertEqual(roadSection.name, "Test Road 1 - 42", "Smallest number should be first when it is the same street")
    }
}
