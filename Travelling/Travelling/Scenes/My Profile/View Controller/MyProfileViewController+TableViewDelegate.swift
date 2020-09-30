//
//  MyProfileViewController+TableViewDelegate.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation
import UIKit

extension MyProfileViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        self.interactor?.shouldSelectItem(request: MyProfileModels.ItemSelection.Request(type: item.type))
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
