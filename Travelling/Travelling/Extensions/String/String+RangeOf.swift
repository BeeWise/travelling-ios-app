//
//  String+RangeOf.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation

extension String {
    func rangeOf(value: String) -> NSRange? {
        let normalizedString = self.folding(options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive], locale: .autoupdatingCurrent).lowercased()
        let normalizedValue = value.folding(options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive], locale: .autoupdatingCurrent).lowercased()
        
        if let range = normalizedString.range(of: normalizedValue) {
            return NSRange(range, in: normalizedString)
        }
        return nil
    }
}
