//
//  ExploreDisplayLogicSpy.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling

class ExploreDisplayLogicSpy: ExploreDisplayLogic {
    var displayWillFetchItemsCalled: Bool = false
    var displayDidFetchItemsCalled: Bool = false
    
    var displayItemsCalled: Bool = false
    var displayItemsViewModel: ExploreModels.ItemsPresentation.ViewModel!
    
    var displayNoMoreItemsCalled: Bool = false
    var displayRemoveNoMoreItemsCalled: Bool = false
    
    var displayEmptyStateCalled: Bool = false
    var displayRemoveEmptyStateCalled: Bool = false
    
    var displayErrorStateCalled: Bool = false
    var displayRemoveErrorStateCalled: Bool = false
    
    func displayWillFetchItems() {
        self.displayWillFetchItemsCalled = true
    }
    
    func displayDidFetchItems() {
        self.displayDidFetchItemsCalled = true
    }
    
    func displayItems(viewModel: ExploreModels.ItemsPresentation.ViewModel) {
        self.displayItemsCalled = true
        self.displayItemsViewModel = viewModel
    }
    
    func displayNoMoreItems(viewModel: ExploreModels.NoMoreItemsPresentation.ViewModel) {
        self.displayNoMoreItemsCalled = true
    }
    
    func displayRemoveNoMoreItems() {
        self.displayRemoveNoMoreItemsCalled = true
    }
    
    func displayEmptyState(viewModel: ExploreModels.EmptyStatePresentation.ViewModel) {
        self.displayEmptyStateCalled = true
    }
    
    func displayRemoveEmptyState() {
        self.displayRemoveEmptyStateCalled = true
    }
    
    func displayErrorState(viewModel: ExploreModels.ErrorStatePresentation.ViewModel) {
        self.displayErrorStateCalled = true
    }
    
    func displayRemoveErrorState() {
        self.displayRemoveErrorStateCalled = true
    }
}
