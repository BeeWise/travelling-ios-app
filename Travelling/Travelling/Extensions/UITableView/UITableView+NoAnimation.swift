//
//  UITableView+NoAnimation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation
import UIKit

extension UITableView {
    open func reloadDataWithoutAnimation() {
        UIView.performWithoutAnimation { self.reloadData() }
    }
    
    open func reloadSectionsWithoutAnimation(sections: IndexSet) {
        UIView.performWithoutAnimation { self.reloadSections(sections, with: .none) }
    }
    
    open func insertSectionsWithoutAnimation(sections: IndexSet) {
        UIView.performWithoutAnimation { self.insertSections(sections, with: .none) }
    }
    
    open func deleteSectionsWithoutAnimation(sections: IndexSet) {
        UIView.performWithoutAnimation { self.deleteSections(sections, with: .none) }
    }
    
    open func reloadRowsWithoutAnimation(at: [IndexPath]) {
        UIView.performWithoutAnimation { self.reloadRows(at: at, with: .none) }
    }
    
    open func insertRowsWithoutAnimation(at: [IndexPath]) {
        UIView.performWithoutAnimation { self.insertRows(at: at, with: .none) }
    }
    
    open func deleteRowsWithoutAnimation(at: [IndexPath]) {
        UIView.performWithoutAnimation { self.deleteRows(at: at, with: .none) }
    }
}
