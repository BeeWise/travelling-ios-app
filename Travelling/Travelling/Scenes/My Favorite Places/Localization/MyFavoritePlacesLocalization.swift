//
//  MyFavoritePlacesLocalization.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 11/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class MyFavoritePlacesLocalization {
    static let shared = MyFavoritePlacesLocalization()
    
    private init() {
        
    }
    
    struct LocalizedKey {
        static let
        title = "MyFavoritePlaces.scene.title",
        emptyStateText = "MyFavoritePlaces.scene.empty.state.text",
        noMorePlacesText = "MyFavoritePlaces.scene.no.more.places.text",
        errorStateText = "MyFavoritePlaces.scene.error.state.text"
    }
    
    let title = LocalizedKey.title.localized()
    let emptyStateText = LocalizedKey.emptyStateText.localized()
    let noMorePlacesText = LocalizedKey.noMorePlacesText.localized()
    let errorStateText = LocalizedKey.errorStateText.localized()
}
