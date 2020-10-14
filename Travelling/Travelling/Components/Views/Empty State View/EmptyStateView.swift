//
//  EmptyStateView.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation
import UIKit

public class EmptyStateView: UIView {
    private let imageSize: CGFloat = 100
    private let spacing: CGFloat = 40
    
    public weak var imageView: UIImageView!
    public weak var spacerView: UIView!
    public weak var textLabel: UILabel!
    
    public var image: UIImage? {
        didSet {
            self.imageView?.image = self.image
        }
    }
    
    public var imageTintColor: UIColor? {
        didSet {
            self.imageView?.tintColor = self.imageTintColor
        }
    }
    
    public var attributedText: NSAttributedString? {
        didSet {
            self.textLabel?.attributedText = self.attributedText
        }
    }
    
    public convenience init(image: UIImage?, attributedText: NSAttributedString?) {
        self.init(frame: .zero)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

// MARK: - Subviews

extension EmptyStateView {
    private func setupSubviews() {
        self.setupImageView()
        self.setupSpacerView()
        self.setupTextLabel()
    }
    
    private func setupImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = self.image
        imageView.tintColor = self.imageTintColor
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        self.imageView = imageView
    }
    
    private func setupSpacerView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        self.spacerView = view
    }
    
    private func setupTextLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.attributedText = self.attributedText
        self.addSubview(label)
        self.textLabel = label
    }
}

// MARK: - Constraints

extension EmptyStateView {
    private func setupSubviewsConstraints() {
        self.setupImageViewConstraints()
        self.setupSpacerViewConstraints()
        self.setupTextLabelConstraints()
    }
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: self.imageSize),
            self.imageView.bottomAnchor.constraint(equalTo: self.spacerView.topAnchor),
            self.imageView.centerXAnchor.constraint(equalTo: self.self.centerXAnchor)
        ])
    }
    
    private func setupSpacerViewConstraints() {
        NSLayoutConstraint.activate([
            self.spacerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.spacerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.spacerView.heightAnchor.constraint(equalTo: self.spacerView.widthAnchor),
            self.spacerView.heightAnchor.constraint(equalToConstant: self.spacing)
        ])
    }
    
    private func setupTextLabelConstraints() {
        NSLayoutConstraint.activate([
            self.textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.textLabel.topAnchor.constraint(equalTo: self.spacerView.bottomAnchor),
            self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
}
