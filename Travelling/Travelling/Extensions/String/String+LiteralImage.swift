//
//  String+LiteralImage.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation
import UIKit

extension String {
    func literalImage() -> UIImage? {
        if self.isEmpty {
            return nil
        }
        return UIImage(named: self)
    }
}
