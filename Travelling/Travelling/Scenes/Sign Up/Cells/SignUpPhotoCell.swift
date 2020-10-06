//
//  SignUpPhotoCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

import Foundation
import UIKit

protocol SignUpPhotoCellDelegate: NSObjectProtocol {
    func signUpPhotoCell(cell: SignUpPhotoCell?, didSelect button: UIButton, itemType: SignUpModels.ItemType)
}

class SignUpPhotoCell: UITableViewCell {
    weak var containerView: UIView!
    weak var photoImageView: LoadingImageView!
    weak var uploadPhotoButton: UIButton!
    
    weak var delegate: SignUpPhotoCellDelegate?
    
    var itemType: SignUpModels.ItemType!
    
    init() {
        super.init(style: .default, reuseIdentifier: SignUpPhotoCell.defaultReuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItemType(itemType: SignUpModels.ItemType) {
        self.itemType = itemType
    }
    
    func setImage(image: UIImage?, contentMode: UIView.ContentMode) {
        self.photoImageView?.contentMode = contentMode
        self.photoImageView?.image = image
    }
}

// MARK: - Actions

extension SignUpPhotoCell {
    @objc func touchUpInsideUploadPhotoButton(button: UIButton) {
        self.delegate?.signUpPhotoCell(cell: self, didSelect: button, itemType: self.itemType)
    }
}

// MARK: - Subviews configuration

extension SignUpPhotoCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupContainerView()
        self.setupPhotoImageView()
        self.setupUploadPhotoButton()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = SignUpStyle.shared.photoCellModel.backgroundColor
    }
    
    private func setupContainerView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(view)
        self.containerView = view
    }
    
    private func setupPhotoImageView() {
        let imageView = LoadingImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isRounded = true
        imageView.backgroundColor = SignUpStyle.shared.photoCellModel.imageBackgroundColor
        imageView.image = SignUpStyle.shared.photoCellModel.placeholderImage
        imageView.clipsToBounds = true
        self.containerView?.addSubview(imageView)
        self.photoImageView = imageView
    }
    
    private func setupUploadPhotoButton() {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = SignUpStyle.shared.photoCellModel.buttonBackgroundColor
        button.layer.cornerRadius = SignUpStyle.shared.photoCellModel.buttonCornerRadius
        button.setAttributedTitle(NSAttributedString(string: SignUpLocalization.shared.uploadPhotoTitle, attributes: SignUpStyle.shared.photoCellModel.buttonTextAttributes()), for: .normal)
        button.contentEdgeInsets = SignUpStyle.shared.photoCellModel.buttonContentEdgeInsets
        button.addTarget(self, action: #selector(SignUpPhotoCell.touchUpInsideUploadPhotoButton(button:)), for: .touchUpInside)
        self.containerView?.addSubview(button)
        self.uploadPhotoButton = button
    }
}

// MARK: - Constraints configuration

extension SignUpPhotoCell {
    private func setupSubviewsConstraints() {
        self.setupContainerViewConstraints()
        self.setupPhotoImageViewConstraints()
        self.setupUploadPhotoButtonConstraints()
    }
    
    private func setupContainerViewConstraints() {
        self.containerView?.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        self.containerView?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15).isActive = true
        self.containerView?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        self.containerView?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    private func setupPhotoImageViewConstraints() {
        self.photoImageView?.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 15).isActive = true
        self.photoImageView?.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        self.photoImageView?.widthAnchor.constraint(equalToConstant: SignUpStyle.shared.imageItemModel.imageWidth).isActive = true
        self.photoImageView?.heightAnchor.constraint(equalToConstant: SignUpStyle.shared.imageItemModel.imageHeight).isActive = true
    }
    
    private func setupUploadPhotoButtonConstraints() {
        self.uploadPhotoButton?.topAnchor.constraint(equalTo: self.photoImageView.bottomAnchor, constant: 15).isActive = true
        self.uploadPhotoButton?.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10).isActive = true
        self.uploadPhotoButton?.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
    }
}
