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
        
        data = NSDictionary(objects: ["Test MOTORVe", "42"], forKeys:["POINT_1_STREET", "POINT_1_STREET_NUMBER"])
        roadSectionPoint = RoadSectionPoint(data: data, pointID: id)
        XCTAssertNotEqual(roadSectionPoint.type, .Highway, "Street names not containing Motorvej should not be of type .Highway")
    }
    
    func testRoadTypeWithRoute() {
        let id = 1
        var data = NSDictionary(objects: ["15", "42"], forKeys:["POINT_1_STREET", "POINT_1_STREET_NUMBER"])
        var roadSectionPoint = RoadSectionPoint(data: data, pointID: id)
        XCTAssertEqual(roadSectionPoint.type, .Route, "Street names containing only digits should be of type .Route")
        
        data = NSDictionary(objects: ["505", "42"], forKeys:["POINT_1_STREET", "POINT_1_STREET_NUMBER"])
        roadSectionPoint = RoadSectionPoint(data: data, pointID: id)
        XCTAssertEqual(roadSectionPoint.type, .Route, "Street names containing only digits should be of type .Route")
        
        data = NSDictionary(objects: ["F505", "42"], forKeys:["POINT_1_STREET", "POINT_1_STREET_NUMBER"])
        roadSectionPoint = RoadSectionPoint(data: data, pointID: id)
        XCTAssertNotEqual(roadSectionPoint.type, .Route, "Street names not containing only digits should not be of type .Route")
    }
    
    func testRoadTypeWithDefault() {
        let id = 1
        var data = NSDictionary(objects: ["Test Road", "42"], forKeys:["POINT_1_STREET", "POINT_1_STREET_NUMBER"])
        var roadSectionPoint = RoadSectionPoint(data: data, pointID: id)
        XCTAssertEqual(roadSectionPoint.type, .Road, "Street names not containing only digits and not containing motorvej should be of type .Road")
    }

}
