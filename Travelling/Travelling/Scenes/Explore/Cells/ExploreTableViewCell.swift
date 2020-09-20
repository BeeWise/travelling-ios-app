//
//  ExploreTableViewCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ExploreTableViewCellDelegate: AnyObject {
    
}

protocol ExploreTableViewCellInterface: AnyObject {
    func setImage(image: UIImage?, contentMode: UIView.ContentMode)
    func setIsLoadingImage(isLoading: Bool)
}

class ExploreTableViewCell: UITableViewCell, ExploreTableViewCellInterface {
    weak var containerView: UIView!
    weak var backgroundImageView: UIImageView!
    weak var blurredBackgroundView: UIView!
    weak var activityIndicatorView: UIActivityIndicatorView!
    weak var titleLabel: UILabel!
    
    weak var delegate: ExploreTableViewCellDelegate?
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: ExploreTableViewCell.defaultReuseIdentifier)
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
    
    func setImageDominantColor(color: UIColor?) {
        self.backgroundImageView?.backgroundColor = color
    }
    
    func setImage(image: UIImage?, contentMode: UIView.ContentMode) {
        self.backgroundImageView?.image = image
        self.backgroundImageView?.contentMode = contentMode
    }
    
    func setIsLoadingImage(isLoading: Bool) {
        if isLoading {
            self.activityIndicatorView?.startAnimating()
            self.activityIndicatorView?.isHidden = false
        } else {
            self.activityIndicatorView?.isHidden = true
            self.activityIndicatorView?.stopAnimating()
        }
    }
}

// MARK: - Subviews

extension ExploreTableViewCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupContainerView()
        self.setupBackgroundImageView()
        self.setupBlurredBackgroundView()
        self.setupActivityIndicatorView()
        self.setupTitleLabel()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = ExploreStyle.shared.cellModel.backgroundColor
    }
    
    private func setupContainerView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = ExploreStyle.shared.cellModel.containerViewBackgroundColor
        view.layer.cornerRadius = ExploreStyle.shared.cellModel.containerViewCornerRadius
        self.contentView.addSubview(view)
        self.containerView = view
    }
    
    private func setupBackgroundImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        self.containerView?.addSubview(imageView)
        self.backgroundImageView = imageView
    }
    
    private func setupBlurredBackgroundView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = ExploreStyle.shared.cellModel.blurredBackgroundColor
        self.containerView?.addSubview(view)
        self.blurredBackgroundView = view
    }
    
    private func setupActivityIndicatorView() {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = ExploreStyle.shared.cellModel.activityIndicatorColor
        view.hidesWhenStopped = false
        self.blurredBackgroundView?.addSubview(view)
        self.activityIndicatorView = view
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        self.blurredBackgroundView?.addSubview(label)
        self.titleLabel = label
    }
}

// MARK: - Constraints

extension ExploreTableViewCell {
    private func setupSubviewsConstraints() {
        self.setupContainerViewConstraints()
        self.setupBackgroundImageViewConstraints()
        self.setupBlurredBackgroundViewConstraints()
        self.setupActivityIndicatorViewConstraints()
        self.setupTitleLabelConstraints()
    }
    
    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            self.containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.containerView.heightAnchor.constraint(equalToConstant: ExploreStyle.shared.cellModel.containerViewMinimumHeight)
        ])
    }
    
    private func setupBackgroundImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor)
        ])
    }
    
    private func setupBlurredBackgroundViewConstraints() {
        NSLayoutConstraint.activate([
            self.blurredBackgroundView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.blurredBackgroundView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            self.blurredBackgroundView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.blurredBackgroundView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor)
        ])
    }
    
    private func setupActivityIndicatorViewConstraints() {
        NSLayoutConstraint.activate([
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.blurredBackgroundView.centerXAnchor),
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.blurredBackgroundView.centerYAnchor)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(greaterThanOrEqualTo: self.blurredBackgroundView.topAnchor, constant: 15),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.blurredBackgroundView.bottomAnchor, constant: -15),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.blurredBackgroundView.leadingAnchor, constant: 15),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.blurredBackgroundView.trailingAnchor, constant: -15)
        ])
    }
}
