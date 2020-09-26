//
//  UITableViewSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation
import UIKit

class UITableViewSpy: UITableView {
    var reloadDataCalled: Bool = false
    var reloadRowsCalled: Bool = false
    var reloadSectionsCalled: Bool = false
    var scrollToRowCalled: Bool = false
    var performBatchUpdatesCalled: Bool = false
    var insertRowsCalled: Bool = false
    var deleteRowsCalled: Bool = false
    var beginUpdatesCalled: Bool = false
    var endUpdatesCalled: Bool = false
    
    override func reloadData() {
        self.reloadDataCalled = true
    }
    
    override func reloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        self.reloadRowsCalled = true
    }
    
    override func reloadSections(_ sections: IndexSet, with animation: UITableView.RowAnimation) {
        self.reloadSectionsCalled = true
        super.reloadSections(sections, with: animation)
    }
    
    override func scrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        self.scrollToRowCalled = true
    }
    
    override func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
        self.performBatchUpdatesCalled = true
        super.performBatchUpdates(updates, completion: completion)
    }
    
    override func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        self.insertRowsCalled = true
        super.insertRows(at: indexPaths, with: animation)
    }
    
    override func deleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        self.deleteRowsCalled = true
        super.deleteRows(at: indexPaths, with: animation)
    }
    
    override func beginUpdates() {
        self.beginUpdatesCalled = true
        super.beginUpdates()
    }
    
    override func endUpdates() {
        self.endUpdatesCalled = true
        super.endUpdates()
    }
}
