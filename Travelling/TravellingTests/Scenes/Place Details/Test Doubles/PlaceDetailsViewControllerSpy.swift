//
//  PlaceDetailsViewControllerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

@testable import Travelling
import Foundation
import UIKit

class PlaceDetailsViewControllerSpy: PlaceDetailsViewController {
    var presentCalled: Bool = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentCalled = true
    }
}
