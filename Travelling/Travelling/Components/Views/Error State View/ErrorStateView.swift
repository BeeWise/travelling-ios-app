//
//  ErrorStateView.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import UIKit

public protocol ErrorStateViewDelegate: AnyObject {
    func errorStateView(view: ErrorStateView?, touchUpInsideButton button: UIButton?)
}

public class ErrorStateView: UIView {
    private let imageSize: CGFloat = 120
    private let spacing: CGFloat = 40
    
    public weak var imageView: UIImageView!
    public weak var spacerView: UIView!
    public weak var button: UIButton!
    
    public weak var delegate: ErrorStateViewDelegate?
    
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
            self.button?.setAttributedTitle(self.attributedText, for: .normal)
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

extension ErrorStateView {
    private func setupSubviews() {
        self.setupImageView()
        self.setupSpacerView()
        self.setupButton()
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
    
    private func setupButton() {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.numberOfLines = 0
        button.setAttributedTitle(self.attributedText, for: .normal)
        button.addTarget(self, action: #selector(ErrorStateView.touchUpInsideButton), for: .touchUpInside)
        self.addSubview(button)
        self.button = button
    }
}

// MARK: - Actions

extension ErrorStateView {
    @objc func touchUpInsideButton() {
        self.delegate?.errorStateView(view: self, touchUpInsideButton: self.button)
    }
}

// MARK: - Constraints

extension ErrorStateView {
    private func setupSubviewsConstraints() {
        self.setupImageViewConstraints()
        self.setupSpacerViewConstraints()
        self.setupButtonConstraints()
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
    
    private func setupButtonConstraints() {
        NSLayoutConstraint.activate([
            self.button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.button.topAnchor.constraint(equalTo: self.spacerView.bottomAnchor),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
}
