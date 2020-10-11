//
//  MyFavoritePlacesViewController+TableViewDataSource.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 11/10/2020.
//

import Foundation
import UIKit

extension MyFavoritePlacesViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedItem = self.sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MyFavoritePlacesTableViewCell.defaultReuseIdentifier, for: indexPath) as! MyFavoritePlacesTableViewCell
        displayedItem.cellInterface = cell
        cell.setTitle(title: displayedItem.title)
        cell.setSubtitle(subtitle: displayedItem.subtitle)
        cell.setImageDominantColor(color: displayedItem.imageDominantColor)
        cell.setImage(image: displayedItem.image, contentMode: displayedItem.imageContentMode)
        cell.setIsLoadingImage(isLoading: displayedItem.isLoadingImage)
        cell.setIsFavorite(isFavorite: displayedItem.isFavorite)
        self.interactor?.shouldFetchImage(request: MyFavoritePlacesModels.ImageFetching.Request(item: displayedItem))
        return cell
    }
}
