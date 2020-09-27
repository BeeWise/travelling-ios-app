//
//  Photo.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 27/09/2020.
//

import Foundation

public class Photo: Codable {
    var id: String
    
    var imageName: String?
    var imageUrl: String?
    var imageDominantColor: String?
    
    init(id: String) {
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageName = "image_name"
        case imageUrl = "image_url"
        case imageDominantColor = "image_dominant_color"
    }
}
