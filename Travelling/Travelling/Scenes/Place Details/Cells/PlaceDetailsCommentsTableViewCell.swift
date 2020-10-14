//
//  PlaceDetailsCommentsTableViewCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

import Foundation
import UIKit

protocol PlaceDetailsCommentsTableViewCellDelegate: AnyObject {
    func placeDetailsCommentsTableViewCell(_ cell: PlaceDetailsCommentsTableViewCell?, didSelectComments button: UIButton?)
}

class PlaceDetailsCommentsTableViewCell: UITableViewCell {
    weak var containerView: UIStackView!
    weak var commentsButton: UIButton!
    weak var timeButton: UIButton!
    
    weak var delegate: PlaceDetailsCommentsTableViewCellDelegate?
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: PlaceDetailsCommentsTableViewCell.defaultReuseIdentifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setComments(comments: NSAttributedString?) {
        self.commentsButton?.setAttributedTitle(comments, for: .normal)
    }
    
    func setTime(time: NSAttributedString?) {
        self.timeButton?.setAttributedTitle(time, for: .normal)
    }
}

// MARK: - Subviews configuration

extension PlaceDetailsCommentsTableViewCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupContainerView()
        self.setupCommentsButton()
        self.setupTimeButton()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.backgroundColor = PlaceDetailsStyle.shared.commentsCellModel.backgroundColor
    }
    
    private func setupContainerView() {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = PlaceDetailsStyle.shared.commentsCellModel.buttonSpacing
        self.contentView.addSubview(view)
        self.containerView = view
    }
    
    private func setupCommentsButton() {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = PlaceDetailsStyle.shared.commentsCellModel.tintColor
        button.setImage(PlaceDetailsStyle.shared.commentsCellModel.commentsImage, for: .normal)
        button.setContentSpacing(PlaceDetailsStyle.shared.commentsCellModel.buttonSpacing)
        button.addTarget(self, action: #selector(PlaceDetailsCommentsTableViewCell.touchUpInsideCommentsButton), for: .touchUpInside)
        self.containerView?.addArrangedSubview(button)
        self.commentsButton = button
    }
    
    private func setupTimeButton() {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = PlaceDetailsStyle.shared.commentsCellModel.tintColor
        button.setImage(PlaceDetailsStyle.shared.commentsCellModel.timeImage, for: .normal)
        button.isUserInteractionEnabled = false
        button.setContentSpacing(PlaceDetailsStyle.shared.commentsCellModel.buttonSpacing)
        self.containerView?.addArrangedSubview(button)
        self.timeButton = button
    }
}

// MARK: - Actions

extension PlaceDetailsCommentsTableViewCell {
    @objc func touchUpInsideCommentsButton() {
        self.delegate?.placeDetailsCommentsTableViewCell(self, didSelectComments: self.commentsButton)
    }
}

// MARK: - Constraints configuration

extension PlaceDetailsCommentsTableViewCell {
    private func setupSubviewsConstraints() {
        self.setupContainerViewConstraints()
    }
    
    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30),
            self.containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            self.containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30)
        ])
    }
}
