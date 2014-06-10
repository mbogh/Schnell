//
//  Section.swift
//  Schnell
//
//  Created by Morten Bøgh on 10/06/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import Foundation

//    "POINT_1_STREET": "Århusvej",
//    "POINT_1_LAT": "56.23172069428216",
//    "POINT_1_NAME": "4320",
//    "POINT_1_CITY": "Hinnerup",
//    "POINT_2_NAME": "4322",
//    "POINT_2_LNG": "10.116589665412903",
//    "POINT_2_STREET": "Århusvej",
//    "NDT_IN_KMH": 71,
//    "POINT_2_POSTAL_CODE": "8382",
//    "POINT_2_COUNTRY": "Denmark",
//    "RBA_ID": 159103,
//    "ORGANISATION": "COWI",
//    "DURATION_IN_SEC": 52,
//    "POINT_2_LAT": "56.22579478256016",
//    "POINT_1_POSTAL_CODE": "8382",
//    "POINT_2_STREET_NUMBER": "0",
//    "POINT_2_CITY": "Hinnerup",
//    "ROAD_TYPE": "MAJOR_ROAD",
//    "POINT_1_LNG": "10.104986076057457",
//    "REPORT_ID": 158324,
//    "POINT_1_COUNTRY": "Denmark",
//    "DISTANCE_IN_METERS": 1030,
//    "REPORT_NAME": "AAR_BT_0001 4320 4322",
//    "POINT_1_STREET_NUMBER": "72",
//    "_id": 160


struct Section {
    struct Point {
        let name: String
        let street: String
        let streetNumber: String
        let latitude: Float
        let longtitude: Float
        let zipcode: String
        let city: String
        let country: String
    }
    var id: Int?
    let startPoint: Point?
    let endPoint: Point?
    
    init(data: Dictionary<String, AnyObject>) {
        self.id = data["_id"] as Int!
        
    }
}