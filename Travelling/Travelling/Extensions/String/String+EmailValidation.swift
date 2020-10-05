//
//  String+EmailValidation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 05/10/2020.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedString.isEmpty else {
            return false
        }
        
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return false
        }
        
        let range = NSRange(trimmedString.startIndex..<trimmedString.endIndex, in: trimmedString)
        guard let firstMatch = detector.firstMatch(in: trimmedString, options: .anchored, range: range) else {
            return false
        }
        guard firstMatch.resultType == .link else {
            return false
        }
        guard firstMatch.url?.scheme == "mailto" else {
            return false
        }
        guard NSEqualRanges(firstMatch.range, range) else {
            return false
        }
        guard !trimmedString.hasPrefix("mailto:") else {
            return false
        }
        
        return true
    }
}
