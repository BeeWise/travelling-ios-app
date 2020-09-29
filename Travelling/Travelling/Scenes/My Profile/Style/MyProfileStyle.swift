//
//  MyProfileStyle.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 27/09/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class MyProfileStyle {
    static let shared = MyProfileStyle()
    
    var navigationBarModel: NavigationBarModel
    
    var contentViewModel: ContentViewModel
    var tableViewModel: TableViewModel
    var informationCellModel: InformationCellModel
    var titleCellModel: TitleCellModel
    
    private init() {
        self.navigationBarModel = NavigationBarModel()
        self.contentViewModel = ContentViewModel()
        self.tableViewModel = TableViewModel()
        self.informationCellModel = InformationCellModel()
        self.titleCellModel = TitleCellModel()
    }
    
    struct NavigationBarModel {
        var isTranslucent: Bool = false
        var tintColor: UIColor = ApplicationStyle.colors.primary
        var barTintColor: UIColor = ApplicationStyle.colors.primaryLight
        
        func titleAttributes() -> [NSAttributedString.Key: Any] {
            return [
                NSAttributedString.Key.foregroundColor: ApplicationStyle.colors.primary,
                NSAttributedString.Key.font: ApplicationStyle.fonts.bold(size: UIFont.labelFontSize)
            ]
        }
    }
    
    struct ContentViewModel {
        var backgroundColor = ApplicationStyle.colors.accentAlpha
    }
    
    struct TableViewModel {
        var backgroundColor = ApplicationStyle.colors.accentAlpha
        var separatorColor: UIColor = ApplicationStyle.colors.accent
        var activityIndicatorSize: CGFloat = 50
        var activityIndicatorColor: UIColor = ApplicationStyle.colors.primary
    }
    
    struct InformationCellModel {
        func nameAttributes() -> [NSAttributedString.Key: Any] {
            return [
                NSAttributedString.Key.foregroundColor: ApplicationStyle.colors.primary,
                NSAttributedString.Key.font: ApplicationStyle.fonts.preferredFont(style: .body)
            ]
        }
        
        func titleAttributes() -> [NSAttributedString.Key: Any] {
            return [
                NSAttributedString.Key.foregroundColor: ApplicationStyle.colors.primaryDark,
                NSAttributedString.Key.font: ApplicationStyle.fonts.preferredFont(style: .body)
            ]
        }
        
        func descriptionAttributes() -> [NSAttributedString.Key: Any] {
            return [
                NSAttributedString.Key.foregroundColor: ApplicationStyle.colors.primaryDark,
                NSAttributedString.Key.font: ApplicationStyle.fonts.preferredFont(style: .body)
            ]
        }
        
        var backgroundColor: UIColor = ApplicationStyle.colors.primaryLight
        
        var avatarSize: CGFloat = 120
        var avatarBackgroundColor: UIColor = ApplicationStyle.colors.accent
        var avatarActivityIndicatorColor: UIColor = ApplicationStyle.colors.white
        var avatarPlaceholderImage: UIImage = ApplicationStyle.images.placeholderImageIcon
    }
    
    struct TitleCellModel {
        func titleAttributes() -> [NSAttributedString.Key: Any] {
            return [
                NSAttributedString.Key.foregroundColor: ApplicationStyle.colors.primaryDark,
                NSAttributedString.Key.font: ApplicationStyle.fonts.preferredFont(style: .body)
            ]
        }
    }
}