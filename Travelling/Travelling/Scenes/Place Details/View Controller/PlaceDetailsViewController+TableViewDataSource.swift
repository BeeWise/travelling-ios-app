//
//  PlaceDetailsViewController+TableViewDataSource.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

import Foundation
import UIKit

extension PlaceDetailsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        switch item.type {
            case .photo: return self.photoCell(tableView, indexPath: indexPath, item: item)
            case .description: return self.descriptionCell(tableView, indexPath: indexPath, item: item)
            case .comments: return self.commentsCell(tableView, indexPath: indexPath, item: item)
        }
    }
}

// MARK: - Photo cell

extension PlaceDetailsViewController: PlaceDetailsPhotoTableViewCellDelegate {
    private func photoCell(_ tableView: UITableView, indexPath: IndexPath, item: PlaceDetailsModels.DisplayedItem) -> PlaceDetailsPhotoTableViewCell {
        guard let model = item.model as? PlaceDetailsModels.PhotoModel else {
            return PlaceDetailsPhotoTableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceDetailsPhotoTableViewCell.defaultReuseIdentifier, for: indexPath) as? PlaceDetailsPhotoTableViewCell ?? PlaceDetailsPhotoTableViewCell()
        model.cellInterface = cell
        cell.delegate = self
        cell.setImageDominantColor(color: model.imageDominantColor)
        cell.setImage(image: model.image, contentMode: model.imageContentMode)
        cell.setIsLoadingImage(isLoading: model.isLoadingImage)
        self.interactor?.shouldFetchImage(request: PlaceDetailsModels.ImageFetching.Request(model: model))
        return cell
    }
    
    func placeDetailsPhotoTableViewCell(cell: PlaceDetailsPhotoTableViewCell?, touchUpInsidePhoto imageView: LoadingImageView?) {
        self.interactor?.shouldSelectPhoto()
    }
}

// MARK: - Description cell

extension PlaceDetailsViewController {
    private func descriptionCell(_ tableView: UITableView, indexPath: IndexPath, item: PlaceDetailsModels.DisplayedItem) -> PlaceDetailsDescriptionTableViewCell {
        guard let model = item.model as? PlaceDetailsModels.DescriptionModel else {
            return PlaceDetailsDescriptionTableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceDetailsDescriptionTableViewCell.defaultReuseIdentifier, for: indexPath) as? PlaceDetailsDescriptionTableViewCell ?? PlaceDetailsDescriptionTableViewCell()
        cell.setTitle(title: model.title)
        cell.setText(text: model.text)
        return cell
    }
}

// MARK: - Comments cell

extension PlaceDetailsViewController: PlaceDetailsCommentsTableViewCellDelegate {
    private func commentsCell(_ tableView: UITableView, indexPath: IndexPath, item: PlaceDetailsModels.DisplayedItem) -> PlaceDetailsCommentsTableViewCell {
        guard let model = item.model as? PlaceDetailsModels.CommentsModel else {
            return PlaceDetailsCommentsTableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceDetailsCommentsTableViewCell.defaultReuseIdentifier, for: indexPath) as? PlaceDetailsCommentsTableViewCell ?? PlaceDetailsCommentsTableViewCell()
        cell.delegate = self
        cell.setComments(comments: model.comments)
        cell.setTime(time: model.time)
        return cell
    }
    
    func placeDetailsCommentsTableViewCell(_ cell: PlaceDetailsCommentsTableViewCell?, didSelectComments button: UIButton?) {
        self.interactor?.shouldNavigateToPlaceComments()
    }
}
