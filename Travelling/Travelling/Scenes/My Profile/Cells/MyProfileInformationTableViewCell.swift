//
//  MyProfileInformationTableViewCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 27/09/2020.
//

import Foundation
import UIKit

protocol MyProfileInformationTableViewCellInterface: AnyObject {
    func setImage(image: UIImage?, contentMode: UIView.ContentMode)
    func setIsLoadingImage(isLoading: Bool)
}
