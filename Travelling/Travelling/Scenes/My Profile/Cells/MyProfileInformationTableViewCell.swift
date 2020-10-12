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

protocol MyProfileInformationTableViewCellDelegate: AnyObject {
    func myProfileInformationTableViewCell(cell: MyProfileInformationTableViewCell?, touchUpInsideAvatar imageView: LoadingImageView?)
}

class MyProfileInformationTableViewCell: UITableViewCell, MyProfileInformationTableViewCellInterface {
    weak var avatarImageView: LoadingImageView!
    
    weak var containerView: UIStackView!
    weak var nameLabel: UILabel!
    weak var titleLabel: UILabel!
    weak var descriptionLabel: UILabel!
    
    weak var delegate: MyProfileInformationTableViewCellDelegate?
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: MyProfileInformationTableViewCell.defaultReuseIdentifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setName(name: NSAttributedString?) {
        self.nameLabel?.attributedText = name
    }
    
    func setTitle(title: NSAttributedString?) {
        self.titleLabel?.attributedText = title
    }
    
    func setDescription(description: NSAttributedString?) {
        self.descriptionLabel?.attributedText = description
    }
    
    func setImageDominantColor(color: UIColor?) {
        self.avatarImageView?.backgroundColor = color
    }
    
    func setImage(image: UIImage?, contentMode: UIView.ContentMode) {
        self.avatarImageView?.image = image
        self.avatarImageView?.contentMode = contentMode
    }
    
    func setIsLoadingImage(isLoading: Bool) {
        self.avatarImageView?.setLoading(isLoading: isLoading)
    }
}

// MARK: - Subviews

extension MyProfileInformationTableViewCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupAvatarImageView()
        self.setupContainerView()
        self.setupNameLabel()
        self.setupTitleLabel()
        self.setupDescriptionLabel()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = MyProfileStyle.shared.informationCellModel.backgroundColor
    }
    
    private func setupAvatarImageView() {
        let imageView = LoadingImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.isRounded = true
        imageView.backgroundColor = MyProfileStyle.shared.informationCellModel.avatarBackgroundColor
        imageView.activityIndicatorColor = MyProfileStyle.shared.informationCellModel.avatarActivityIndicatorColor
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MyProfileInformationTableViewCell.touchUpInsideImageView)))
        self.contentView.addSubview(imageView)
        self.avatarImageView = imageView
    }
    
    private func setupContainerView() {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = MyProfileStyle.shared.informationCellModel.labelSpacing
        self.contentView.addSubview(view)
        self.containerView = view
    }
    
    private func setupNameLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        self.containerView?.addArrangedSubview(label)
        self.nameLabel = label
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        self.containerView?.addArrangedSubview(label)
        self.titleLabel = label
    }
    
    private func setupDescriptionLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        self.containerView?.addArrangedSubview(label)
        self.descriptionLabel = label
    }
}

// MARK: - Actions

extension MyProfileInformationTableViewCell {
    @objc func touchUpInsideImageView() {
        self.delegate?.myProfileInformationTableViewCell(cell: self, touchUpInsideAvatar: self.avatarImageView)
    }
}

// MARK: - Constraints

extension MyProfileInformationTableViewCell {
    private func setupSubviewsConstraints() {
        self.setupAvatarImageViewConstraints()
        self.setupContainerViewConstraints()
    }
    
    private func setupAvatarImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 45),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: MyProfileStyle.shared.informationCellModel.avatarSize),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: MyProfileStyle.shared.informationCellModel.avatarSize),
            self.avatarImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ])
    }
    
    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.containerView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.containerView.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 30),
            self.containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -45),
        ])
    }
}
