//
//  UIFont+WithTraits.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation
import UIKit

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        if let descriptor = self.fontDescriptor.withSymbolicTraits(traits) {
            return UIFont(descriptor: descriptor, size: 0)
        }
        return self
    }
    
    func bold() -> UIFont {
        return self.withTraits(traits: .traitBold)
    }
    
    func italic() -> UIFont {
        return self.withTraits(traits: .traitItalic)
    }
}
