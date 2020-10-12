//
//  MyFavoritePlacesTableViewCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 11/10/2020.
//

import UIKit

protocol MyFavoritePlacesTableViewCellInterface: AnyObject {
    func setImage(image: UIImage?, contentMode: UIView.ContentMode)
    func setIsLoadingImage(isLoading: Bool)
}

protocol MyFavoritePlacesTableViewCellDelegate: AnyObject {
    func myFavoritePlacesTableViewCell(_ cell: MyFavoritePlacesTableViewCell?, touchUpInsideFavorite button: UIButton?, forItem id: String)
}

class MyFavoritePlacesTableViewCell: UITableViewCell, MyFavoritePlacesTableViewCellInterface {
    weak var placeImageView: LoadingImageView!
    
    weak var labelContainerView: UIStackView!
    weak var titleLabel: UILabel!
    weak var subtitleLabel: UILabel!
    
    weak var favoriteButton: UIButton!
    
    weak var delegate: MyFavoritePlacesTableViewCellDelegate?
    
    var itemId: String!
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: MyFavoritePlacesTableViewCell.defaultReuseIdentifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: NSAttributedString?) {
        self.titleLabel?.attributedText = title
    }
    
    func setSubtitle(subtitle: NSAttributedString?) {
        self.subtitleLabel?.attributedText = subtitle
    }
    
    func setImageDominantColor(color: UIColor?) {
        self.placeImageView?.backgroundColor = color
    }
    
    func setImage(image: UIImage?, contentMode: UIView.ContentMode) {
        self.placeImageView?.image = image
        self.placeImageView?.contentMode = contentMode
    }
    
    func setIsLoadingImage(isLoading: Bool) {
        self.placeImageView?.setLoading(isLoading: isLoading)
    }
    
    func setIsFavorite(isFavorite: Bool) {
        if isFavorite {
            self.favoriteButton?.setImage(MyFavoritePlacesStyle.shared.cellModel.favoriteButtonSelectedIcon, for: .normal)
        } else {
            self.favoriteButton?.setImage(MyFavoritePlacesStyle.shared.cellModel.favoriteButtonUnselectedIcon, for: .normal)
        }
    }
}

// MARK: - Subviews

extension MyFavoritePlacesTableViewCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupPlaceImageView()
        self.setupLabelContainerView()
        self.setupTitleLabel()
        self.setupSubtitleLabel()
        self.setupFavoriteButton()
    }
    
    private func setupContentView() {
        self.contentView.clipsToBounds = true
        self.backgroundColor = MyFavoritePlacesStyle.shared.cellModel.backgroundColor
    }
    
    private func setupPlaceImageView() {
        let imageView = LoadingImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.activityIndicatorColor = MyFavoritePlacesStyle.shared.cellModel.activityIndicatorColor
        self.contentView.addSubview(imageView)
        self.placeImageView = imageView
    }
    
    private func setupLabelContainerView() {
        let view = UIStackView()
        view.spacing = MyFavoritePlacesStyle.shared.cellModel.labelSpacing
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(view)
        self.labelContainerView = view
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        self.labelContainerView?.addArrangedSubview(label)
        self.titleLabel = label
    }
    
    private func setupSubtitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        self.labelContainerView?.addArrangedSubview(label)
        self.subtitleLabel = label
    }
    
    private func setupFavoriteButton() {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = MyFavoritePlacesStyle.shared.cellModel.favoriteButtonTintColor
        button.addTarget(self, action: #selector(MyFavoritePlacesTableViewCell.touchUpInsideFavoriteButton), for: .touchUpInside)
        self.contentView.addSubview(button)
        self.favoriteButton = button
    }
}

// MARK: - Actions

extension MyFavoritePlacesTableViewCell {
    @objc func touchUpInsideFavoriteButton() {
        self.delegate?.myFavoritePlacesTableViewCell(self, touchUpInsideFavorite: self.favoriteButton, forItem: self.itemId)
    }
}

// MARK: - Constraints

extension MyFavoritePlacesTableViewCell {
    private func setupSubviewsConstraints() {
        self.setupPlaceImageViewConstraints()
        self.setupLabelContainerViewConstraints()
        self.setupFavoriteButtonConstraints()
    }
    
    private func setupPlaceImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.placeImageView.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 15),
            self.placeImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -15),
            self.placeImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.placeImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.placeImageView.widthAnchor.constraint(equalToConstant: MyFavoritePlacesStyle.shared.cellModel.imageViewSize),
            self.placeImageView.heightAnchor.constraint(equalToConstant: MyFavoritePlacesStyle.shared.cellModel.imageViewSize)
        ])
    }
    
    private func setupLabelContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.labelContainerView.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 15),
            self.labelContainerView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -15),
            self.labelContainerView.leadingAnchor.constraint(equalTo: self.placeImageView.trailingAnchor, constant: 15),
            self.labelContainerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    private func setupFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            self.favoriteButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.favoriteButton.leadingAnchor.constraint(equalTo: self.labelContainerView.trailingAnchor, constant: 15),
            self.favoriteButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.favoriteButton.widthAnchor.constraint(equalToConstant: MyFavoritePlacesStyle.shared.cellModel.favoriteButtonSize),
            self.favoriteButton.heightAnchor.constraint(equalToConstant: MyFavoritePlacesStyle.shared.cellModel.favoriteButtonSize)
        ])
    }
}
