//
//  PhotoLibraryHandler.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

import Foundation
import UIKit

class PhotoLibraryHandler {
    var isPhotoLibraryAvailable: Bool {
        return UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
    }
    
    var isCameraAvailable: Bool {
        return UIImagePickerController.isSourceTypeAvailable(.camera)
    }
}
