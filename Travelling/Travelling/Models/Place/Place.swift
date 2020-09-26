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
    
    var imageName: String?
    var imageUrl: String?
    var imageDominantColor: String?
    
    init(id: String, location: Location) {
        self.id = id
        self.location = location
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case location
        case name
        case imageName = "image_name"
        case imageUrl = "image_url"
        case imageDominantColor = "image_dominant_color"
    }
}
