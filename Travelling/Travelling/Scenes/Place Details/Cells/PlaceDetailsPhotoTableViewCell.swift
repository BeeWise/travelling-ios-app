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

protocol PlaceDetailsPhotoTableViewCellDelegate: AnyObject {
    func placeDetailsPhotoTableViewCell(cell: PlaceDetailsPhotoTableViewCell?, touchUpInsidePhoto imageView: LoadingImageView?)
}

class PlaceDetailsPhotoTableViewCell: UITableViewCell, PlaceDetailsPhotoTableViewCellInterface {
    weak var photoImageView: LoadingImageView!
        
    weak var delegate: PlaceDetailsPhotoTableViewCellDelegate?
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: PlaceDetailsPhotoTableViewCell.defaultReuseIdentifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setImageDominantColor(color: UIColor?) {
        self.photoImageView?.backgroundColor = color
    }
    
    func setImage(image: UIImage?, contentMode: UIView.ContentMode) {
        self.photoImageView?.image = image
        self.photoImageView?.contentMode = contentMode
    }
    
    func setIsLoadingImage(isLoading: Bool) {
        self.photoImageView?.setLoading(isLoading: isLoading)
    }
}

// MARK: - Subviews

extension PlaceDetailsPhotoTableViewCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupPhotoImageView()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = PlaceDetailsStyle.shared.photoCellModel.backgroundColor
    }
    
    private func setupPhotoImageView() {
        let imageView = LoadingImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.activityIndicatorColor = PlaceDetailsStyle.shared.photoCellModel.imageActivityIndicatorColor
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(PlaceDetailsPhotoTableViewCell.touchUpInsideImageView)))
        self.contentView.addSubview(imageView)
        self.photoImageView = imageView
    }
}

// MARK: - Actions

extension PlaceDetailsPhotoTableViewCell {
    @objc func touchUpInsideImageView() {
        self.delegate?.placeDetailsPhotoTableViewCell(cell: self, touchUpInsidePhoto: self.photoImageView)
    }
}

// MARK: - Constraints

extension PlaceDetailsPhotoTableViewCell {
    private func setupSubviewsConstraints() {
        self.setupPhotoImageViewConstraints()
    }
    
    private func setupPhotoImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.photoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.photoImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.photoImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: PlaceDetailsStyle.shared.photoCellModel.imageHeight)
        ])
    }
}
