//
//  UIButton+ContentSpacing.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

import Foundation
import UIKit

extension UIButton {
    func setContentSpacing(_ spacing: CGFloat) {
        let inset = spacing / 2
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -inset, bottom: 0, right: inset)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: -inset)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
}
