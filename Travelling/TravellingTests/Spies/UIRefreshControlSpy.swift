//
//  UIRefreshControlSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation
import UIKit

class UIRefreshControlSpy: UIRefreshControl {
    var endRefreshingCalled: Bool = false
    
    override func endRefreshing() {
        self.endRefreshingCalled = true
    }
}
