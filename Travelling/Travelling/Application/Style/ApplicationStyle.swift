//
//  ApplicationStyle.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

import Foundation
import UIKit

class ApplicationStyle {
    static let shared = ApplicationStyle()
    
    private init() {
        
    }
    
    struct colors {
        static let
        primary = UIColor(named: "primary", in: Bundle.main, compatibleWith: nil)!,
        primaryLight = UIColor(named: "primary_light", in: Bundle.main, compatibleWith: nil)!,
        primaryDark = UIColor(named: "primary_dark", in: Bundle.main, compatibleWith: nil)!,
        secondary = UIColor(named: "secondary", in: Bundle.main, compatibleWith: nil)!,
        tertiary = UIColor(named: "tertiary", in: Bundle.main, compatibleWith: nil)!,
        accent = UIColor(named: "accent", in: Bundle.main, compatibleWith: nil)!,
        accentAlpha = UIColor(named: "accent_alpha", in: Bundle.main, compatibleWith: nil)!,
        transparent = UIColor.clear,
        white = UIColor.white
    }
    
    struct images {
        static let
        exploreTabIcon = UIImage(named: "explore_tab_icon", in: Bundle.main, compatibleWith: nil)!,
        myFavoritesTabIcon = UIImage(named: "my_favorites_tab_icon", in: Bundle.main, compatibleWith: nil)!,
        myProfileTabIcon = UIImage(named: "my_profile_tab_icon", in: Bundle.main, compatibleWith: nil)!,
        placeholderImageIcon = UIImage(named: "placeholder_image_icon", in: Bundle.main, compatibleWith: nil)!,
        errorStateIcon = UIImage(named: "error_state_icon", in: Bundle.main, compatibleWith: nil)!,
        emptyStateIcon = UIImage(named: "empty_state_icon", in: Bundle.main, compatibleWith: nil)!,
        closeIcon = UIImage(named: "close_icon", in: Bundle.main, compatibleWith: nil)!,
        logoIcon = UIImage(named: "logo_icon", in: Bundle.main, compatibleWith: nil)!,
        commentsIcon = UIImage(named: "comments_icon", in: Bundle.main, compatibleWith: nil)!,
        timeIcon = UIImage(named: "time_icon", in: Bundle.main, compatibleWith: nil)!,
        favoriteIcon = UIImage(named: "favorite_icon", in: Bundle.main, compatibleWith: nil)!,
        notFavoriteIcon = UIImage(named: "not_favorite_icon", in: Bundle.main, compatibleWith: nil)!
    }
    
    struct fonts {
        static func regular(size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size)
        }
        
        static func bold(size: CGFloat) -> UIFont {
            return UIFont.boldSystemFont(ofSize: size)
        }
        
        static func preferredFont(style: UIFont.TextStyle) -> UIFont {
            return UIFont.preferredFont(forTextStyle: style)
        }
    }
}
