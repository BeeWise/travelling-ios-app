//
//  UIScrollView+LoadMore.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation
import UIKit

extension UIScrollView {
    open func shouldLoadMoreBeforeReaching(threshold: CGFloat) -> Bool {
        let currentOffset = self.contentOffset.y
        let maximumOffset = self.contentSize.height - self.frame.size.height
        
        guard self.isDecelerating else { return false }
        guard maximumOffset > 0 else { return false }
        guard currentOffset > 0 else { return false }
        guard currentOffset >= (maximumOffset - threshold) else { return false }
        
        return true
    }
}
