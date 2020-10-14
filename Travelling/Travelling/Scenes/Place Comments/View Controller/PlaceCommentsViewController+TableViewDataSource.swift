//
//  PlaceCommentsViewController+TableViewDataSource.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/10/2020.
//

import UIKit

extension PlaceCommentsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedItem = self.sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceCommentsTableViewCell.defaultReuseIdentifier, for: indexPath) as! PlaceCommentsTableViewCell
        displayedItem.cellInterface = cell
        cell.setName(name: displayedItem.name)
        cell.setText(text: displayedItem.text)
        cell.setTime(time: displayedItem.time)
        cell.setImageDominantColor(color: displayedItem.imageDominantColor)
        cell.setImage(image: displayedItem.image, contentMode: displayedItem.imageContentMode)
        cell.setIsLoadingImage(isLoading: displayedItem.isLoadingImage)
        self.interactor?.shouldFetchImage(request: PlaceCommentsModels.ImageFetching.Request(item: displayedItem))
        return cell
    }
}
