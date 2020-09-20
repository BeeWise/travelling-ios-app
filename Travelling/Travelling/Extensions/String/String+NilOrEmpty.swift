//
//  String+NilOrEmpty.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation

extension Optional where Wrapped == String {
    func isNilOrEmpty() -> Bool {
        if let unwrapped = self {
            return unwrapped.trimmingCharacters(in: .whitespaces).isEmpty
        }
        return true
    }
}
