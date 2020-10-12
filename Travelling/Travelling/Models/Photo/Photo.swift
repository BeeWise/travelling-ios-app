//
//  Photo.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 27/09/2020.
//

import Foundation

public class Photo: Codable, Equatable {
    public static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id &&
            lhs.imageName == rhs.imageName &&
            lhs.imageUrl == rhs.imageUrl &&
            lhs.imageDominantColor == rhs.imageDominantColor
    }
    
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
