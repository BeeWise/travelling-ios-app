//
//  MyProfileTitleTableViewCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation
import UIKit

class MyProfileTitleTableViewCell: UITableViewCell {
    convenience init() {
        self.init(style: .default, reuseIdentifier: MyProfileTitleTableViewCell.defaultReuseIdentifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: NSAttributedString?) {
        self.textLabel?.attributedText = title
    }
    
    func setIsSelectable(isSelectable: Bool) {
        self.selectionStyle = isSelectable ? .default : .none
    }
    
    private func setupSubviews() {
        self.setupContentView()
        self.setupTextLabel()
    }
    
    private func setupContentView() {
        self.backgroundColor = MyProfileStyle.shared.titleCellModel.backgroundColor
    }
    
    private func setupTextLabel() {
        self.textLabel?.adjustsFontForContentSizeCategory = true
        self.textLabel?.numberOfLines = 0
    }
}
