//
//  TableViewErrorHeaderFooterView.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation
import UIKit

public protocol TableViewErrorHeaderFooterViewDelegate: AnyObject {
    func tableViewErrorHeaderFooterView(view: TableViewErrorHeaderFooterView?, didSelectTitle button: UIButton?)
}

public class TableViewErrorHeaderFooterView: UITableViewHeaderFooterView, DefaultReuseIdentifier {
    public weak var titleButton: UIButton!
    
    public weak var delegate: TableViewErrorHeaderFooterViewDelegate?
    
    public convenience init() {
        self.init(reuseIdentifier: TableViewErrorHeaderFooterView.defaultReuseIdentifier)
    }
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    public func setTitle(title: NSAttributedString?) {
        self.titleButton?.setAttributedTitle(title, for: .normal)
    }
}

// MARK: - Subviews

extension TableViewErrorHeaderFooterView {
    private func setupSubviews() {
        self.setupTitleButton()
    }
    
    private func setupTitleButton() {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.numberOfLines = 0
        button.addTarget(self, action: #selector(TableViewErrorHeaderFooterView.touchUpInsideTitleButton), for: .touchUpInside)
        self.contentView.addSubview(button)
        self.titleButton = button
    }
}

// MARK: - Actions

extension TableViewErrorHeaderFooterView {
    @objc func touchUpInsideTitleButton() {
        self.delegate?.tableViewErrorHeaderFooterView(view: self, didSelectTitle: self.titleButton)
    }
}

// MARK: - Constraints

extension TableViewErrorHeaderFooterView {
    private func setupSubviewsConstraints() {
        self.setupTitleButtonConstraints()
    }
    
    private func setupTitleButtonConstraints() {
        NSLayoutConstraint.activate([
            self.titleButton.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.titleButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.titleButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
    }
}
