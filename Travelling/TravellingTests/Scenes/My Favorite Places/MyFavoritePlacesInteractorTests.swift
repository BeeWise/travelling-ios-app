//
//  MyFavoritePlacesInteractorTests.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 11/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling
import XCTest

class MyFavoritePlacesInteractorTests: XCTestCase {
    var sut: MyFavoritePlacesInteractor!
    var presenterSpy: MyFavoritePlacesPresentationLogicSpy!
    var workerSpy: MyFavoritePlacesWorkerSpy!
  
    // MARK: - Test lifecycle
  
    override func setUp() {
        super.setUp()
        self.setupMyFavoritePlacesInteractor()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    // MARK: - Test setup
  
    func setupMyFavoritePlacesInteractor() {
        self.sut = MyFavoritePlacesInteractor()
        
        self.presenterSpy = MyFavoritePlacesPresentationLogicSpy()
        self.sut.presenter = self.presenterSpy
        
        self.workerSpy = MyFavoritePlacesWorkerSpy(delegate: self.sut)
        self.sut.worker = self.workerSpy
    }
    
    // MARK: - Fetch items tests
    
    func testShouldFetchItemsShouldSetIsFetchingItemsToTrueForPaginationModel() {
        self.sut.paginationModel.isFetchingItems = false
        self.sut.paginationModel.noMoreItems = false
        self.sut.shouldFetchItems()
        XCTAssertTrue(self.sut.paginationModel.isFetchingItems)
    }
    
    func testShouldFetchItemsShouldAskThePresenterToPresentWillFetchItemsWhenItIsNotFetchingItemsAndThereAreMoreItems() {
        self.sut.paginationModel.isFetchingItems = false
        self.sut.paginationModel.noMoreItems = false
        self.sut.shouldFetchItems()
        XCTAssertTrue(self.presenterSpy.presentWillFetchItemsCalled)
    }
    
    func testShouldFetchItemsShouldAskThePresenterToPresentDisableSearchBarWhenItIsNotFetchingItemsAndThereAreMoreItems() {
        self.sut.paginationModel.isFetchingItems = false
        self.sut.paginationModel.noMoreItems = false
        self.sut.shouldFetchItems()
        XCTAssertTrue(self.presenterSpy.presentDisableSearchBarCalled)
    }
    
    func testShouldFetchItemsShouldAskTheWorkerToFetchItemsWhenItIsNotFetchingItemsAndThereAreMoreItems() {
        self.sut.paginationModel.isFetchingItems = false
        self.sut.paginationModel.noMoreItems = false
        self.sut.shouldFetchItems()
        XCTAssertTrue(self.workerSpy.fetchItemsCalled)
    }
    
    func testSuccessDidFetchItemsShouldAppendItemsForPaginationModel() {
        self.sut.paginationModel.items = [Place(id: "id1", location: Location(id: "id3", latitude: 10, longitude: 10))]
        let count =  self.sut.paginationModel.items.count
        let items = [Place(id: "id2", location: Location(id: "id4", latitude: 15, longitude: 15))]
        self.sut.successDidFetchItems(items: items)
        XCTAssertEqual(self.sut.paginationModel.items.count, count + items.count)
    }
    
    func testSuccessDidFetchItemsShouldIncrementByOneCurrentPageForPaginationModel() {
        let currentPage = self.sut.paginationModel.currentPage
        self.sut.successDidFetchItems(items: [])
        XCTAssertEqual(self.sut.paginationModel.currentPage, currentPage + 1)
    }
    
    func testSuccessDidFetchItemsShouldSetIsFetchingItemsToFalseForPaginationModel() {
        self.sut.paginationModel.isFetchingItems = true
        self.sut.successDidFetchItems(items: [])
        XCTAssertFalse(self.sut.paginationModel.isFetchingItems)
    }
    
    func testSuccessDidFetchItemsShouldSetHasErrorToFalseForPaginationModel() {
        self.sut.paginationModel.hasError = true
        self.sut.successDidFetchItems(items: [])
        XCTAssertFalse(self.sut.paginationModel.hasError)
    }
    
    func testSuccessDidFetchItemsShouldAskThePresenterToPresentDidFetchItems() {
        self.sut.successDidFetchItems(items: [])
        XCTAssertTrue(self.presenterSpy.presentDidFetchItemsCalled)
    }
    
    func testSuccessDidFetchItemsShouldAskThePresenterToPresentEnableSearchBar() {
        self.sut.successDidFetchItems(items: [])
        XCTAssertTrue(self.presenterSpy.presentEnableSearchBarCalled)
    }
    
    func testSuccessDidFetchItemsShouldAskThePresenterToPresentRemoveErrorState() {
        self.sut.successDidFetchItems(items: [])
        XCTAssertTrue(self.presenterSpy.presentRemoveErrorStateCalled)
    }
    
    func testSuccessDidFetchItemsShouldAskThePresenterToPresentNewItems() {
        self.sut.successDidFetchItems(items: [])
        XCTAssertTrue(self.presenterSpy.presentNewItemsCalled)
    }
    
    func testSuccessDidFetchItemsShouldSetNoMoreItemsToTrueForPaginationModelWhenThereAreNoMoreItemsToFetch() {
        self.sut.paginationModel.noMoreItems = false
        self.sut.successDidFetchItems(items: [])
        XCTAssertTrue(self.sut.paginationModel.noMoreItems)
    }
    
    func testSuccessDidFetchItemsShouldShouldAskThePresenterToPresentNoMoreItemsWhenThereAreNoMoreItemsToFetch() {
        self.sut.paginationModel.noMoreItems = false
        self.sut.successDidFetchItems(items: [])
        XCTAssertTrue(self.presenterSpy.presentNoMoreItemsCalled)
    }
    
    func testSuccessDidFetchItemsShouldAskThePresenterToPresentEmptyStateWhenThereAreNoMoreItemsAndThereAreNoItems() {
        self.sut.paginationModel.items.removeAll()
        self.sut.successDidFetchItems(items: [])
        XCTAssertTrue(self.presenterSpy.presentEmptyStateCalled)
    }
    
    func testSuccessDidFetchItemsShouldAskThePresenterToPresenterRemoveNoMoreItemsWhenThereAreNoMoreItemsAndThereAreNoItems() {
        self.sut.paginationModel.items.removeAll()
        self.sut.successDidFetchItems(items: [])
        XCTAssertTrue(self.presenterSpy.presentRemoveNoMoreItemsCalled)
    }
    
    func testFailureDidFetchItemsShouldSetIsFetchingItemsToFalseForPaginationModel() {
        self.sut.paginationModel.isFetchingItems = true
        self.sut.failureDidFetchItems(error: OperationError.noDataAvailable)
        XCTAssertFalse(self.sut.paginationModel.isFetchingItems)
    }
    
    func testFailureDidFetchItemsShouldSetHasErrorToTrueForPaginationModel() {
        self.sut.paginationModel.isFetchingItems = false
        self.sut.failureDidFetchItems(error: OperationError.noDataAvailable)
        XCTAssertTrue(self.sut.paginationModel.hasError)
    }
    
    func testFailureDidFetchItemsShouldAskThePresenterToPresentDidFetchItems() {
        self.sut.failureDidFetchItems(error: OperationError.noDataAvailable)
        XCTAssertTrue(self.presenterSpy.presentDidFetchItemsCalled)
    }
    
    func testFailureDidFetchItemsShouldAskThePresenterToPresentEnableSearchBar() {
        self.sut.failureDidFetchItems(error: OperationError.noDataAvailable)
        XCTAssertTrue(self.presenterSpy.presentEnableSearchBarCalled)
    }
    
    func testFailureDidFetchItemsShouldAskThePresenterToPresentErrorState() {
        self.sut.failureDidFetchItems(error: OperationError.noDataAvailable)
        XCTAssertTrue(self.presenterSpy.presentErrorStateCalled)
    }
    
    // MARK: - Fetch image tests
    
    func testShouldFetchImageShouldAskThePresenterToPresentPlaceholderImageWhenThereIsNoImageAndImageName() {
        let item = MyFavoritePlacesModels.DisplayedItem(id: "id")
        item.image = nil
        item.imageName = nil
        self.sut.shouldFetchImage(request: MyFavoritePlacesModels.ImageFetching.Request(item: item))
        XCTAssertTrue(self.presenterSpy.presentPlaceholderImageCalled)
    }
    
    func testShouldFetchImageShouldAskThePresenterToPresentPlaceholderImageWhenThereIsNoImageAndEmptyImageName() {
        let item = MyFavoritePlacesModels.DisplayedItem(id: "id")
        item.image = nil
        item.imageName = ""
        self.sut.shouldFetchImage(request: MyFavoritePlacesModels.ImageFetching.Request(item: item))
        XCTAssertTrue(self.presenterSpy.presentPlaceholderImageCalled)
    }
    
    func testShouldFetchImageShouldAskThePresenterToPresentWillFetchImageWhenThereIsNoImageAndIsNotLoading() {
        let item = MyFavoritePlacesModels.DisplayedItem(id: "id")
        item.image = nil
        item.imageName = "imageName"
        item.isLoadingImage = false
        self.sut.shouldFetchImage(request: MyFavoritePlacesModels.ImageFetching.Request(item: item))
        XCTAssertTrue(self.presenterSpy.presentWillFetchImageCalled)
    }
    
    func testShouldFetchImageShouldAskTheWorkerToFetchImageWhenThereIsNoImageAndIsNotLoading() {
        let item = MyFavoritePlacesModels.DisplayedItem(id: "id")
        item.image = nil
        item.imageName = "imageName"
        item.isLoadingImage = false
        self.sut.shouldFetchImage(request: MyFavoritePlacesModels.ImageFetching.Request(item: item))
        XCTAssertTrue(self.workerSpy.fetchImageCalled)
    }
    
    func testSuccessDidFetchImageShouldAskThePresenterToPresentImage() {
        self.sut.successDidFetchImage(item: MyFavoritePlacesModels.DisplayedItem(id: "id"), image: nil)
        XCTAssertTrue(self.presenterSpy.presentImageCalled)
    }
    
    func testSuccessDidFetchImageShouldAskThePresenterToPresentDidFetchImage() {
        self.sut.successDidFetchImage(item: MyFavoritePlacesModels.DisplayedItem(id: "id"), image: nil)
        XCTAssertTrue(self.presenterSpy.presentDidFetchImageCalled)
    }
    
    func testFailureDidFetchImageShouldAskThePresenterToPresentPlaceholderImage() {
        self.sut.failureDidFetchImage(item: MyFavoritePlacesModels.DisplayedItem(id: "id"), error: .noDataAvailable)
        XCTAssertTrue(self.presenterSpy.presentPlaceholderImageCalled)
    }
    
    func testFailureDidFetchImageShouldAskThePresenterToPresentDidFetchImage() {
        self.sut.failureDidFetchImage(item: MyFavoritePlacesModels.DisplayedItem(id: "id"), error: .noDataAvailable)
        XCTAssertTrue(self.presenterSpy.presentDidFetchImageCalled)
    }
    
    // MARK: - Search items tests
    
    func testShouldBeginSearchState() {
        self.sut.paginationModel.isSearchingItems = false
        self.sut.shouldBeginSearchState()
        XCTAssertTrue(self.sut.paginationModel.isSearchingItems)
    }
    
    func testShouldEndSearchState() {
        self.sut.paginationModel.isSearchingItems = true
        self.sut.shouldEndSearchState()
        XCTAssertFalse(self.sut.paginationModel.isSearchingItems)
    }
    
    func testShouldSearchItemsShouldAskThePresenterToPresentSearchedItems() {
        self.sut.paginationModel.items = [self.place()]
        self.sut.shouldSearchItems(request: MyFavoritePlacesModels.ItemsSearching.Request(text: "name"))
        XCTAssertTrue(self.presenterSpy.presentSearchedItemsCalled)
    }
    
    func testShouldSearchItemsShouldAskThePresenterToPresentItemsWhenNotSearching() {
        self.sut.paginationModel.items = [self.place()]
        self.sut.shouldSearchItems(request: MyFavoritePlacesModels.ItemsSearching.Request(text: nil))
        XCTAssertTrue(self.presenterSpy.presentItemsCalled)
    }
    
    // MARK: - Navigation test
    
    func testShouldNavigateToPlaceDetailsShouldAskThePresenterToPresentNavigateToPlaceDetails() {
        let id = "placeId"
        self.sut.paginationModel.items = [self.place()]
        self.sut.shouldNavigateToPlaceDetails(request: MyFavoritePlacesModels.ItemNavigation.Request(id: id))
        XCTAssertTrue(self.presenterSpy.presentNavigateToPlaceDetailsCalled)
    }
    
    private func place() -> Place {
        let place = Place(id: "placeId", location: Location(id: "locationId", latitude: 47, longitude: 27))
        place.name = "Name"
        return place
    }
}
