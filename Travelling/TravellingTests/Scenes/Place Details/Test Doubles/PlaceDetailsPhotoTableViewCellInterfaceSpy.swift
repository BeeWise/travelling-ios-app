//
//  PlaceDetailsPhotoTableViewCellInterfaceSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

@testable import Travelling
import Foundation
import UIKit

class PlaceDetailsPhotoTableViewCellInterfaceSpy: PlaceDetailsPhotoTableViewCellInterface {
    var setImageCalled: Bool = false
    var setIsLoadingImageCalled: Bool = false
    
    func setImage(image: UIImage?, contentMode: UIView.ContentMode) {
        self.setImageCalled = true
    }
    
    func setIsLoadingImage(isLoading: Bool) {
        self.setIsLoadingImageCalled = true
    }
}
