//
//  ForgotPasswordButtonCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 05/10/2020.
//

import Foundation
import UIKit

protocol ForgotPasswordButtonCellDelegate: AnyObject {
    func forgotPasswordButtonCell(cell: ForgotPasswordButtonCell?, didSelect button: UIButton?, itemType: ForgotPasswordModels.ItemType)
}

class ForgotPasswordButtonCell: UITableViewCell {
    weak var containerView: UIView!
    weak var button: LoadingButton!
    
    weak var delegate: ForgotPasswordButtonCellDelegate?
    
    var itemType: ForgotPasswordModels.ItemType!
    
    init() {
        super.init(style: .default, reuseIdentifier: ForgotPasswordButtonCell.defaultReuseIdentifier)
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
    
    func setItemType(itemType: ForgotPasswordModels.ItemType) {
        self.itemType = itemType
    }
    
    func setTitle(title: NSAttributedString?) {
        self.button?.setAttributedTitle(title, for: .normal)
    }
    
    func setIsEnabled(isEnabled: Bool) {
        self.button?.isEnabled = isEnabled
        self.button?.backgroundColor = isEnabled ? ForgotPasswordStyle.shared.buttonCellModel.enabledBackgroundColor : ForgotPasswordStyle.shared.buttonCellModel.disabledBackgroundColor
    }
    
    func setIsLoading(isLoading: Bool) {
        self.button?.setLoading(isLoading: isLoading)
    }
}

// MARK: - Actions

extension ForgotPasswordButtonCell {
    @objc func touchUpInsideButton(button: UIButton) {
        self.delegate?.forgotPasswordButtonCell(cell: self, didSelect: button, itemType: self.itemType)
    }
}

// MARK: - Subviews configuration

extension ForgotPasswordButtonCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupContainerView()
        self.setupButton()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = ForgotPasswordStyle.shared.buttonCellModel.backgroundColor
    }
    
    private func setupContainerView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(view)
        self.containerView = view
    }
    
    private func setupButton() {
        let button = LoadingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = ForgotPasswordStyle.shared.buttonCellModel.cornerRadius
        button.activityIndicatorColor = ForgotPasswordStyle.shared.buttonCellModel.activityIndicatorColor
        button.contentEdgeInsets = ForgotPasswordStyle.shared.buttonCellModel.contentEdgeInsets
        button.addTarget(self, action: #selector(ForgotPasswordButtonCell.touchUpInsideButton(button:)), for: .touchUpInside)
        self.containerView?.addSubview(button)
        self.button = button
    }
}

// MARK: - Constraints configuration

extension ForgotPasswordButtonCell {
    private func setupSubviewsConstraints() {
        self.setupContainerViewConstraints()
        self.setupButtonConstraints()
    }
    
    private func setupContainerViewConstraints() {
        self.containerView?.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7).isActive = true
        self.containerView?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15).isActive = true
        self.containerView?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        self.containerView?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    private func setupButtonConstraints() {
        self.button?.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        self.button?.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
        self.button?.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        self.button?.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    }
}
