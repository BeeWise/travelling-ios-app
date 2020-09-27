//
//  Place.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

public class Place: Codable {
    var id: String
    
    var location: Location
    
    var name: String?
    
    var photo: Photo?
    
    init(id: String, location: Location) {
        self.id = id
        self.location = location
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case location
        case name
        case photo
    }
}
