//
//  PlaceDetailsDescriptionTableViewCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

import Foundation
import UIKit

class PlaceDetailsDescriptionTableViewCell: UITableViewCell {
    weak var containerView: UIStackView!
    weak var titleLabel: UILabel!
    weak var subtitleLabel: UILabel!
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: PlaceDetailsDescriptionTableViewCell.defaultReuseIdentifier)
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
    
    func setText(text: NSAttributedString?) {
        self.subtitleLabel?.attributedText = text
    }
}

// MARK: - Subviews configuration

extension PlaceDetailsDescriptionTableViewCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupContainerView()
        self.setupTitleLabel()
        self.setupSubtitleLabel()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.backgroundColor = PlaceDetailsStyle.shared.descriptionCellModel.backgroundColor
    }
        
    private func setupContainerView() {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = PlaceDetailsStyle.shared.descriptionCellModel.labelSpacing
        self.contentView.addSubview(view)
        self.containerView = view
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        self.containerView?.addArrangedSubview(label)
        self.titleLabel = label
    }
    
    private func setupSubtitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        self.containerView?.addArrangedSubview(label)
        self.subtitleLabel = label
    }
}

// MARK: - Constraints configuration

extension PlaceDetailsDescriptionTableViewCell {
    private func setupSubviewsConstraints() {
        self.setupContainerViewConstraints()
    }
    
    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 30),
            self.containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30),
            self.containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            self.containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30)
        ])
    }
}
