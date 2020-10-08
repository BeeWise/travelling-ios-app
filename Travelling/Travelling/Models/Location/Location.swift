//
//  Location.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

public class Location: Codable, Equatable {
    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id &&
            lhs.latitude == rhs.latitude &&
            lhs.longitude == rhs.longitude &&
            lhs.city == rhs.city &&
            lhs.country == rhs.country
    }
    
    var id: String
    
    var latitude: Double
    var longitude: Double
    
    var city: String?
    var country: String?
    
    init(id: String, latitude: Double, longitude: Double) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case latitude
        case longitude
        case city
        case country
    }
}
