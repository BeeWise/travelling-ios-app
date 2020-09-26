//
//  InsetLabel.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation
import UIKit

@IBDesignable
public class InsetLabel: UILabel {
    @IBInspectable public var topInset: CGFloat = 0.0
    @IBInspectable public var leftInset: CGFloat = 0.0
    @IBInspectable public var bottomInset: CGFloat = 0.0
    @IBInspectable public var rightInset: CGFloat = 0.0
    
    public var insets: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: self.topInset, left: self.leftInset, bottom: self.bottomInset, right: self.rightInset)
        }
        set {
            self.topInset = newValue.top
            self.leftInset = newValue.left
            self.bottomInset = newValue.bottom
            self.rightInset = newValue.right
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override public func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: self.insets))
    }
    
    override public func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: self.insets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -self.insets.top, left: -self.insets.left, bottom: -self.insets.bottom, right: -self.insets.right)
        return textRect.inset(by: invertedInsets)
    }
}
