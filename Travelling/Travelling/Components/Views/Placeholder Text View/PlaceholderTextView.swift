//
//  PlaceholderTextView.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

import Foundation
import UIKit

public class PlaceholderTextView: UITextView {
    public var attributedPlaceholder: NSAttributedString?
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.contentMode = .redraw
        NotificationCenter.default.addObserver(self, selector: #selector(PlaceholderTextView.textDidChange(notification:)), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if (self.textStorage.length != 0) {
            return
        }
        
        let inset = rect.insetBy(dx: 6, dy: 8)
        self.attributedPlaceholder?.draw(in: inset)
    }
    
    @objc func textDidChange(notification: Foundation.Notification) {
        if notification.object is PlaceholderTextView {
            self.setNeedsDisplay()
        }
    }
}
