//
//  ExploreViewController+Subviews.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

extension ExploreViewController {
    func setupSubviews() {
        self.setupNavigationBar()
        self.setupTitle()
        self.setupContentView()
        self.setupTableView()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = ExploreStyle.shared.navigationBarModel.isTranslucent
        self.navigationController?.navigationBar.tintColor = ExploreStyle.shared.navigationBarModel.tintColor
        self.navigationController?.navigationBar.barTintColor = ExploreStyle.shared.navigationBarModel.barTintColor
        self.navigationController?.navigationBar.titleTextAttributes = ExploreStyle.shared.navigationBarModel.titleAttributes()
    }
    
    private func setupTitle() {
        self.navigationItem.title = ExploreLocalization.shared.title
    }
    
    private func setupContentView() {
        self.view.backgroundColor = ExploreStyle.shared.contentViewModel.backgroundColor
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = ExploreStyle.shared.tableViewModel.backgroundColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        tableView.register(ExploreTableViewCell.self, forCellReuseIdentifier: ExploreTableViewCell.defaultReuseIdentifier)
        self.view.addSubview(tableView)
        self.tableView = tableView
    }
    
    func emptyStateView(image: UIImage?, attributedText: NSAttributedString?) -> EmptyStateView {
        let view = EmptyStateView(frame: self.tableView.frame)
        view.image = image
        view.attributedText = attributedText
        return view
    }
}

extension ExploreViewController {
    func setupSubviewsConstraints() {
        self.setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
