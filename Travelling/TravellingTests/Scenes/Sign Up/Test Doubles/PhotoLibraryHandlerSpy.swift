//
//  PhotoLibraryHandlerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

@testable import Travelling

class PhotoLibraryHandlerSpy: PhotoLibraryHandler {
    var hasPhotoLibrary: Bool = false
    var hasCamera: Bool = false
    
    override var isPhotoLibraryAvailable: Bool {
        return self.hasPhotoLibrary
    }
    
    override var isCameraAvailable: Bool {
        return self.hasCamera
    }
}
