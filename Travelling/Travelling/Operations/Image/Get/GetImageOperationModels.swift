//
//  GetImageOperationModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation
import UIKit

enum GetImageOperationModels {
    struct Request {
        let imageName: String?
    }
    
    struct Response {
        let image: UIImage?
    }
}
