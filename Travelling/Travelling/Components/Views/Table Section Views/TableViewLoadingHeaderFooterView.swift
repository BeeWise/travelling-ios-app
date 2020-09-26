//
//  TableViewLoadingHeaderFooterView.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation
import UIKit

public class TableViewLoadingHeaderFooterView: UITableViewHeaderFooterView, DefaultReuseIdentifier {
    public weak var activityIndicatorView: UIActivityIndicatorView!
    
    public convenience init() {
        self.init(reuseIdentifier: TableViewLoadingHeaderFooterView.defaultReuseIdentifier)
    }
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    public func setColor(color: UIColor) {
        self.activityIndicatorView?.color = color
    }
    
    public func setIsLoading(isLoading: Bool) {
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

extension TableViewLoadingHeaderFooterView {
    private func setupSubviews() {
        self.setupActivityIndicatorView()
    }
    
    private func setupActivityIndicatorView() {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = false
        self.contentView.addSubview(view)
        self.activityIndicatorView = view
    }
}

// MARK: - Constraints

extension TableViewLoadingHeaderFooterView {
    private func setupSubviewsConstraints() {
        self.setupActivityIndicatorViewConstraints()
    }
    
    private func setupActivityIndicatorViewConstraints() {
        NSLayoutConstraint.activate([
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
}
