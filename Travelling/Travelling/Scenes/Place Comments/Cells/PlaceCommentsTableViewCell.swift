//
//  PlaceCommentsTableViewCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/10/2020.
//

import Foundation
import UIKit

protocol PlaceCommentsTableViewCellInterface: AnyObject {
    func setImage(image: UIImage?, contentMode: UIView.ContentMode)
    func setIsLoadingImage(isLoading: Bool)
}

class PlaceCommentsTableViewCell: UITableViewCell, PlaceCommentsTableViewCellInterface {
    weak var avatarImageView: LoadingImageView!
    weak var labelContainerView: UIStackView!
    weak var nameLabel: UILabel!
    weak var commentLabel: UILabel!
    weak var timeLabel: UILabel!
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: PlaceCommentsTableViewCell.defaultReuseIdentifier)
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
    
    func setText(text: NSAttributedString?) {
        self.commentLabel?.attributedText = text
    }
    
    func setTime(time: NSAttributedString?) {
        self.timeLabel?.attributedText = time
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

extension PlaceCommentsTableViewCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupAvatarImageView()
        self.setupLabelContainerView()
        self.setupNameLabel()
        self.setupCommentLabel()
        self.setupTimeLabel()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = PlaceCommentsStyle.shared.cellModel.backgroundColor
    }
    
    private func setupAvatarImageView() {
        let imageView = LoadingImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.isRounded = true
        self.contentView.addSubview(imageView)
        self.avatarImageView = imageView
    }
    
    private func setupLabelContainerView() {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = PlaceCommentsStyle.shared.cellModel.labelSpacing
        self.contentView.addSubview(view)
        self.labelContainerView = view
    }
    
    private func setupNameLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        self.labelContainerView?.addArrangedSubview(label)
        self.nameLabel = label
    }
    
    private func setupCommentLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        self.labelContainerView?.addArrangedSubview(label)
        self.commentLabel = label
    }
    
    private func setupTimeLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        self.labelContainerView?.addArrangedSubview(label)
        self.timeLabel = label
    }
}

// MARK: - Constraints

extension PlaceCommentsTableViewCell {
    private func setupSubviewsConstraints() {
        self.setupAvatarImageViewConstraints()
        self.setupLabelContainerViewConstraints()
    }
    
    private func setupAvatarImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.avatarImageView.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 15),
            self.avatarImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -15),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: PlaceCommentsStyle.shared.cellModel.imageSize),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: PlaceCommentsStyle.shared.cellModel.imageSize),
            self.avatarImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    private func setupLabelContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.labelContainerView.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 15),
            self.labelContainerView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -15),
            self.labelContainerView.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 15),
            self.labelContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.labelContainerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
}
