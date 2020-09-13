//
//  String+Attributes.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

extension String {
    func attributed(attributes: [NSAttributedString.Key: Any]? = nil) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self, attributes: attributes)
    }
}
