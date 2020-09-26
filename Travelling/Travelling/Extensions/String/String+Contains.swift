//
//  String+Contains.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation

extension String {
    func contains(text: String) -> Bool {
        let normalizedString = self.folding(options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive], locale: .autoupdatingCurrent).lowercased()
        let normalizedText = text.folding(options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive], locale: .autoupdatingCurrent).lowercased()
        return normalizedString.contains(normalizedText)
    }
}
