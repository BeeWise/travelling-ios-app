//
//  FullscreenImageViewControllerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

@testable import Travelling
import Foundation
import UIKit

class FullscreenImageViewControllerSpy: FullscreenImageViewController {
    var dismissCalled: Bool = false
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismissCalled = true
    }
}
