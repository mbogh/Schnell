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

enum RoadType {
    case Road
    case Highway
    case Route
}

struct RoadSection {
    
    var id: Int
    let startPoint: RoadSectionPoint
    let endPoint: RoadSectionPoint
    
    init(data: NSDictionary) {
        self.id = data["_id"] as Int
        self.startPoint = RoadSectionPoint(data: data, pointID: 1)
        self.endPoint = RoadSectionPoint(data: data, pointID: 2)
    }
    
    var name: String {
    
    if self.startPoint.isEqualStreet(self.endPoint) {
        let street = self.startPoint.street ? self.startPoint.street : self.endPoint.street
        let type = self.startPoint.street ? self.startPoint.type : self.endPoint.type
        
        switch type {
        case .Highway:
            return "\(street)"
        case .Route:
            return "\(street)"
        case .Road:
            var startNumber = 0, endNumber = 0
            if let start = self.startPoint.streetNumber?.toInt() {
                startNumber = start > 0 ? start : 1
            }
            if let end = self.endPoint.streetNumber?.toInt() {
                endNumber = end > 0 ? end : 1
            }
            
            if (startNumber < endNumber) {
                return "\(street) \(startNumber) - \(endNumber)"
            }
            else {
                return "\(street) \(endNumber) - \(startNumber)"
            }
        default:
            return "\(street) \(self.startPoint.streetNumber) - \(self.endPoint.streetNumber)"
        }
    }
    else { // By design of .isEqualStreet() we know that both streets are non-nil.
        return "\(self.startPoint.name) - \(self.endPoint.name)"
        }
    }
    
    var zipcodeCity: String {
    if self.startPoint.city == self.endPoint.city {
        return "\(self.startPoint.zipcode) \(self.startPoint.city)"
    }
    else {
        return "\(self.startPoint.zipcode) \(self.startPoint.city) - \(self.endPoint.zipcode) \(self.endPoint.city)"
        }
    }
}

struct RoadSectionPoint {
    let street: String?
    let streetNumber: String?
    let latitude: String?
    let longitude: String?
    let zipcode: String?
    let city: String?
    let country: String?
    
    let type: RoadType
    
    init(data: NSDictionary, pointID: Int) {
        self.street = data["POINT_\(pointID)_STREET"] as? String
        self.streetNumber = data["POINT_\(pointID)_STREET_NUMBER"] as? String
        self.latitude = data["POINT_\(pointID)_LAT"] as? String
        self.longitude = data["POINT_\(pointID)_LNG"] as? String
        self.zipcode = data["POINT_\(pointID)_POSTAL_CODE"] as? String
        self.city = data["POINT_\(pointID)_CITY"] as? String
        self.country = data["POINT_\(pointID)_COUNTRY"] as? String
        
        switch self.street {
        case .None:
            type = .Road
        case let streetName where streetName!.lowercaseString.bridgeToObjectiveC().containsString("motorvej"):
            type = .Highway
        case let streetName where streetName!.toInt():
            type = .Route
        default:
            type = .Road
        }
    }
    
    func isEqualStreet(other: RoadSectionPoint) -> Bool {
        return self.street == other.street || (self.street == nil || other.street == nil)
    }
    
    var name: String {
        switch self.type {
        case .Road:
            return "\(self.street) \(self.streetNumber)"
        default:
            return "\(self.street)"
        }
    }
}
