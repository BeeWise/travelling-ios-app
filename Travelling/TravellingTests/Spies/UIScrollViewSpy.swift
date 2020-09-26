//
//  UIScrollViewSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation
import UIKit

class UIScrollViewSpy: UIScrollView {
    var shouldDecelerate: Bool = false
    override var isDecelerating: Bool {
        return self.shouldDecelerate
    }
}
