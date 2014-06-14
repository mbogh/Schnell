//
//  RoadSectionPointTests.swift
//  Schnell
//
//  Created by Morten Bøgh on 14/06/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import XCTest

class RoadSectionPointTests: XCTestCase {

    func testRoadTypeWithHighway() {
        let id = 1
        var data = NSDictionary(objects: ["Test Motorvejen", "42"], forKeys:["POINT_1_STREET", "POINT_1_STREET_NUMBER"])
        var roadSectionPoint = RoadSectionPoint(data: data, pointID: id)
        XCTAssertEqual(roadSectionPoint.type, .Highway, "Street names containing Motorvej should be of type .Highway")
        
        data = NSDictionary(objects: ["Test Motorvej", "42"], forKeys:["POINT_1_STREET", "POINT_1_STREET_NUMBER"])
        roadSectionPoint = RoadSectionPoint(data: data, pointID: id)
        XCTAssertEqual(roadSectionPoint.type, .Highway, "Street names containing Motorvej should be of type .Highway")
        
        data = NSDictionary(objects: ["Test MOTORVejz", "42"], forKeys:["POINT_1_STREET", "POINT_1_STREET_NUMBER"])
        roadSectionPoint = RoadSectionPoint(data: data, pointID: id)
        XCTAssertEqual(roadSectionPoint.type, .Highway, "Street names containing Motorvej should be of type .Highway")
    }

}
