//
//  URLOpenableSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 05/10/2020.
//

@testable import Travelling
import Foundation
import UIKit

class URLOpenableSpy: URLOpenable {
    var canOpenURLCalled: Bool = false
    var canOpenURLValue: Bool = false
    
    var openCalled: Bool = false
    
    func canOpenURL(_ url: URL) -> Bool {
        self.canOpenURLCalled = true
        return self.canOpenURLValue
    }
    
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?) {
        self.openCalled = true
    }
}
