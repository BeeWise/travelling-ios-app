//
//  LoadingButton.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation
import UIKit

@IBDesignable
public class LoadingButton: UIButton {
    @IBInspectable public var activityIndicatorColor: UIColor? = nil {
        didSet {
            self.activityIndicatorView?.color = self.activityIndicatorColor
        }
    }
    
    public weak var activityIndicatorView: UIActivityIndicatorView!
    
    public init() {
        super.init(frame: .zero)
        self.setupActivityIndicatorView()
        self.setupActivityIndicatorViewConstraints()
        self.setLoading(isLoading: false)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupActivityIndicatorView()
        self.setupActivityIndicatorViewConstraints()
        self.setLoading(isLoading: false)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupActivityIndicatorView()
        self.setupActivityIndicatorViewConstraints()
        self.setLoading(isLoading: false)
    }
    
    public func setLoading(isLoading: Bool) {
        if isLoading {
            self.startAnimatingActivityIndicatorView()
            self.hideTitleLabel()
            self.hideImageView()
            self.showActivityIndicatorView()
        } else {
            self.hideActivityIndicatorView()
            self.showTitleLabel()
            self.showImageView()
            self.stopAnimatingActivityIndicatorView()
        }
    }
    
    private func setupActivityIndicatorView() {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = self.activityIndicatorColor
        view.hidesWhenStopped = false
        self.addSubview(view)
        self.activityIndicatorView = view
    }
    
    private func setupActivityIndicatorViewConstraints() {
        NSLayoutConstraint.activate([
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func hideActivityIndicatorView() {
        self.activityIndicatorView?.isHidden = true
    }
    
    private func showActivityIndicatorView() {
        self.activityIndicatorView?.isHidden = false
    }
    
    private func startAnimatingActivityIndicatorView() {
        self.activityIndicatorView?.startAnimating()
    }
    
    private func stopAnimatingActivityIndicatorView() {
        self.activityIndicatorView?.stopAnimating()
    }
    
    private func hideTitleLabel() {
        self.titleLabel?.isHidden = true
        self.titleLabel?.alpha = 0.0
    }
    
    private func showTitleLabel() {
        self.titleLabel?.isHidden = false
        self.titleLabel?.alpha = 1.0
    }
    
    private func hideImageView() {
        self.imageView?.isHidden = true
        self.imageView?.alpha = 0.0
    }
    
    private func showImageView() {
        self.imageView?.isHidden = false
        self.imageView?.alpha = 1.0
    }
}
