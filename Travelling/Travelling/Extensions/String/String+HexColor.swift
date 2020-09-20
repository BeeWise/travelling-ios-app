//
//  String+HexColor.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation
import UIKit

extension String {
    func hexColor() -> UIColor? {
        let hex = self.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var argb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&argb)
        
        let alpha, red, green, blue: UInt64
        switch hex.count {
            case 3: (alpha, red, green, blue) = (255, (argb >> 8) * 17, (argb >> 4 & 0xF) * 17, (argb & 0xF) * 17)
            case 6: (alpha, red, green, blue) = (255, argb >> 16, argb >> 8 & 0xFF, argb & 0xFF)
            case 8: (alpha, red, green, blue) = (argb >> 24, argb >> 16 & 0xFF, argb >> 8 & 0xFF, argb & 0xFF)
            default: return nil
        }
        
        return UIColor(red: CGFloat(red) / 255,
                       green: CGFloat(green) / 255,
                       blue: CGFloat(blue) / 255,
                       alpha: CGFloat(alpha) / 255)
    }
}
