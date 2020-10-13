//
//  PlaceCommentsTableViewCellInterfaceSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/10/2020.
//

@testable import Travelling
import Foundation
import UIKit

class PlaceCommentsTableViewCellInterfaceSpy: PlaceCommentsTableViewCellInterface {
    var setImageCalled: Bool = false
    var setIsLoadingImageCalled: Bool = false
    
    func setImage(image: UIImage?, contentMode: UIView.ContentMode) {
        self.setImageCalled = true
    }
    
    func setIsLoadingImage(isLoading: Bool) {
        self.setIsLoadingImageCalled = true
    }
}
