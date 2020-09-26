//
//  ImageTaskModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation
import UIKit

public enum ImageTaskModels {
    public enum Fetch {
        public struct Request {
            let imageName: String?
        }
        
        public struct Response {
            let image: UIImage?
        }
    }
}
