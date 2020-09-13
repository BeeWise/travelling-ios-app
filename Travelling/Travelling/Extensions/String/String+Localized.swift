//
//  String+Localized.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

import Foundation

extension String {
    func localized(in bundle: Bundle = .main, withComment comment: String = "") -> String {
        return NSLocalizedString(self, bundle: bundle, comment: comment)
    }
}
