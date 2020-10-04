//
//  MyProfileViewController+TableViewDataSource.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation
import UIKit

extension MyProfileViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        switch item.type {
            case .user: return self.informationCell(tableView, indexPath: indexPath, item: item)
            default: return self.titleCell(tableView, indexPath: indexPath, item: item)
        }
    }
}

// MARK: - Information cell

extension MyProfileViewController: MyProfileInformationTableViewCellDelegate {
    private func informationCell(_ tableView: UITableView, indexPath: IndexPath, item: MyProfileModels.DisplayedItem) -> MyProfileInformationTableViewCell {
        guard let model = item.model as? MyProfileModels.UserModel else {
            return MyProfileInformationTableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileInformationTableViewCell.defaultReuseIdentifier, for: indexPath) as? MyProfileInformationTableViewCell ?? MyProfileInformationTableViewCell()
        model.cellInterface = cell
        cell.delegate = self
        cell.setName(name: model.name)
        cell.setTitle(title: model.title)
        cell.setDescription(description: model.description)
        cell.setImageDominantColor(color: model.imageDominantColor)
        cell.setImage(image: model.image, contentMode: model.imageContentMode)
        cell.setIsLoadingImage(isLoading: model.isLoadingImage)
        self.interactor?.shouldFetchImage(request: MyProfileModels.ImageFetching.Request(model: model))
        return cell
    }
    
    func myProfileInformationTableViewCell(cell: MyProfileInformationTableViewCell?, touchUpInsideAvatar imageView: LoadingImageView?) {
        self.interactor?.shouldSelectAvatar()
    }
}

// MARK: - Title cell

extension MyProfileViewController {
    private func titleCell(_ tableView: UITableView, indexPath: IndexPath, item: MyProfileModels.DisplayedItem) -> MyProfileTitleTableViewCell {
        guard let model = item.model as? MyProfileModels.TitleModel else {
            return MyProfileTitleTableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileTitleTableViewCell.defaultReuseIdentifier, for: indexPath) as? MyProfileTitleTableViewCell ?? MyProfileTitleTableViewCell()
        cell.setTitle(title: model.title)
        cell.setIsSelectable(isSelectable: model.isSelectable)
        return cell
    }
}
