//
//  PlaceDetailsPhotoTableViewCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

import Foundation
import UIKit

protocol PlaceDetailsPhotoTableViewCellInterface: AnyObject {
    func setImage(image: UIImage?, contentMode: UIView.ContentMode)
    func setIsLoadingImage(isLoading: Bool)
}
