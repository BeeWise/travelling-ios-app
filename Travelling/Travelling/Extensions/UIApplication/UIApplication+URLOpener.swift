//
//  UIApplication+URLOpener.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 05/10/2020.
//

import Foundation
import UIKit

protocol URLOpenable: AnyObject {
    func canOpenURL(_ url: URL) -> Bool
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?)
}

extension UIApplication: URLOpenable {
    
}
