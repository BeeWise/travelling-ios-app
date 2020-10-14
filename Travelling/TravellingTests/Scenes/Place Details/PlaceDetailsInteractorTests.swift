//
//  PlaceDetailsInteractorTests.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling
import XCTest

class PlaceDetailsInteractorTests: XCTestCase {
    var sut: PlaceDetailsInteractor!
    var presenterSpy: PlaceDetailsPresentationLogicSpy!
    var workerSpy: PlaceDetailsWorkerSpy!
  
    // MARK: - Test lifecycle
  
    override func setUp() {
        super.setUp()
        self.setupPlaceDetailsInteractor()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    // MARK: - Test setup
  
    func setupPlaceDetailsInteractor() {
        self.sut = PlaceDetailsInteractor()
        
        self.presenterSpy = PlaceDetailsPresentationLogicSpy()
        self.sut.presenter = self.presenterSpy
        
        self.workerSpy = PlaceDetailsWorkerSpy(delegate: self.sut)
        self.sut.worker = self.workerSpy
    }
    
    // MARK: - Setup place tests
    
    func testShouldSetupPlaceShouldUpdatePlace() {
        self.sut.place = nil
        let place = Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20))
        self.sut.shouldSetupPlace(request: PlaceDetailsModels.PlaceSetup.Request(place: place))
        XCTAssertEqual(self.sut.place, place)
    }
    
    func testShouldSetupPlaceShouldAskThePresenterToPresentRemoveErrorState() {
        self.sut.shouldSetupPlace(request: PlaceDetailsModels.PlaceSetup.Request(place: Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20))))
        XCTAssertTrue(self.presenterSpy.presentRemoveErrorStateCalled)
    }
    
    func testShouldSetupPlaceShouldAskThePresenterToPresentPlaceTitleWhenThereIsPlace() {
        self.sut.shouldSetupPlace(request: PlaceDetailsModels.PlaceSetup.Request(place: Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20))))
        XCTAssertTrue(self.presenterSpy.presentPlaceTitleCalled)
    }
    
    func testShouldSetupPlaceShouldAskThePresenterToPresentPlaceWhenThereIsPlace() {
        self.sut.shouldSetupPlace(request: PlaceDetailsModels.PlaceSetup.Request(place: Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20))))
        XCTAssertTrue(self.presenterSpy.presentPlaceCalled)
    }
    
    // MARK: - Fetch place tests
    
    func testSuccessDidFetchPlaceShouldUpdateIsFetchingPlaceFlag() {
        self.sut.isFetchingPlace = true
        self.sut.successDidFetchPlace(place: Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20)))
        XCTAssertFalse(self.sut.isFetchingPlace)
    }
    
    func testSuccessDidFetchPlaceShouldUpdatePlace() {
        self.sut.place = nil
        let place = Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20))
        self.sut.successDidFetchPlace(place: place)
        XCTAssertEqual(self.sut.place, place)
    }
    
    func testSuccessDidFetchPlaceShouldAskThePresenterToPresentPlaceTitle() {
        self.sut.successDidFetchPlace(place: Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20)))
        XCTAssertTrue(self.presenterSpy.presentPlaceTitleCalled)
    }
    
    func testSuccessDidFetchPlaceShouldAskThePresenterToPresentPlace() {
        self.sut.successDidFetchPlace(place: Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20)))
        XCTAssertTrue(self.presenterSpy.presentPlaceCalled)
    }
    
    func testSuccessDidFetchPlaceShouldAskThePresenterToPresentRemoveErrorState() {
        self.sut.successDidFetchPlace(place: Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20)))
        XCTAssertTrue(self.presenterSpy.presentRemoveErrorStateCalled)
    }
    
    func testSuccessDidFetchPlaceShouldAskThePresenterToPresentDidFetchPlace() {
        self.sut.successDidFetchPlace(place: Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20)))
        XCTAssertTrue(self.presenterSpy.presentDidFetchPlaceCalled)
    }
    
    func testFailureDidFetchPlaceShouldUpdateIsFetchingPlaceFlag() {
        self.sut.isFetchingPlace = true
        self.sut.failureDidFetchPlace(error: OperationError.noDataAvailable)
        XCTAssertFalse(self.sut.isFetchingPlace)
    }
    
    func testFailureDidFetchPlaceShouldAskThePresenterToPresentErrorState() {
        self.sut.failureDidFetchPlace(error: OperationError.noDataAvailable)
        XCTAssertTrue(self.presenterSpy.presentErrorStateCalled)
    }
    
    func testFailureDidFetchPlaceShouldAskThePresenterToPresentDidFetchPlace() {
        self.sut.failureDidFetchPlace(error: OperationError.noDataAvailable)
        XCTAssertTrue(self.presenterSpy.presentDidFetchPlaceCalled)
    }
    
    // MARK: - Refresh place tests
    
    func testShouldRefreshPlaceShouldUpdateIsFetchingPlaceFlag() {
        self.sut.isFetchingPlace = false
        self.sut.shouldRefreshPlace()
        XCTAssertTrue(self.sut.isFetchingPlace)
    }
    
    func testShouldRefreshPlaceShouldAskThePresenterToPresentResetPlace() {
        self.sut.isFetchingPlace = false
        self.sut.shouldRefreshPlace()
        XCTAssertTrue(self.presenterSpy.presentResetPlaceCalled)
    }
    
    func testShouldRefreshPlaceShouldAskThePresenterToPresentRemoveErrorState() {
        self.sut.isFetchingPlace = false
        self.sut.shouldRefreshPlace()
        XCTAssertTrue(self.presenterSpy.presentRemoveErrorStateCalled)
    }
    
    func testShouldRefreshPlaceShouldAskThePresenterToPresentWillFetchPlace() {
        self.sut.isFetchingPlace = false
        self.sut.shouldRefreshPlace()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPlaceCalled)
    }
    
    func testShouldRefreshPlaceShouldAskTheWorkerToFetchPlace() {
        self.sut.isFetchingPlace = false
        self.sut.shouldRefreshPlace()
        XCTAssertTrue(self.workerSpy.fetchPlaceCalled)
    }
    
    // MARK: - Fetch image tests
    
    func testShouldFetchImageShouldAskThePresenterToPresentPlaceholderImageWhenThereIsNoImageAndImageName() {
        let model = PlaceDetailsModels.PhotoModel()
        model.image = nil
        model.imageName = nil
        self.sut.shouldFetchImage(request: PlaceDetailsModels.ImageFetching.Request(model: model))
        XCTAssertTrue(self.presenterSpy.presentPlaceholderImageCalled)
    }
    
    func testShouldFetchImageShouldAskThePresenterToPresentPlaceholderImageWhenThereIsNoImageAndEmptyImageName() {
        let model = PlaceDetailsModels.PhotoModel()
        model.image = nil
        model.imageName = ""
        self.sut.shouldFetchImage(request: PlaceDetailsModels.ImageFetching.Request(model: model))
        XCTAssertTrue(self.presenterSpy.presentPlaceholderImageCalled)
    }
    
    func testShouldFetchImageShouldAskThePresenterToPresentWillFetchImageWhenThereIsNoImageAndIsNotLoading() {
        let model = PlaceDetailsModels.PhotoModel()
        model.image = nil
        model.imageName = "imageName"
        model.isLoadingImage = false
        self.sut.shouldFetchImage(request: PlaceDetailsModels.ImageFetching.Request(model: model))
        XCTAssertTrue(self.presenterSpy.presentWillFetchImageCalled)
    }
    
    func testShouldFetchImageShouldAskTheWorkerToFetchImageWhenThereIsNoImageAndIsNotLoading() {
        let model = PlaceDetailsModels.PhotoModel()
        model.image = nil
        model.imageName = "imageName"
        model.isLoadingImage = false
        self.sut.shouldFetchImage(request: PlaceDetailsModels.ImageFetching.Request(model: model))
        XCTAssertTrue(self.workerSpy.fetchImageCalled)
    }
    
    func testSuccessDidFetchImageShouldAskThePresenterToPresentImage() {
        self.sut.successDidFetchImage(model: PlaceDetailsModels.PhotoModel(), image: nil)
        XCTAssertTrue(self.presenterSpy.presentImageCalled)
    }
    
    func testSuccessDidFetchImageShouldAskThePresenterToPresentDidFetchImage() {
        self.sut.successDidFetchImage(model: PlaceDetailsModels.PhotoModel(), image: nil)
        XCTAssertTrue(self.presenterSpy.presentDidFetchImageCalled)
    }
    
    func testFailureDidFetchImageShouldAskThePresenterToPresentPlaceholderImage() {
        self.sut.failureDidFetchImage(model: PlaceDetailsModels.PhotoModel(), error: .noDataAvailable)
        XCTAssertTrue(self.presenterSpy.presentPlaceholderImageCalled)
    }
    
    func testFailureDidFetchImageShouldAskThePresenterToPresentDidFetchImage() {
        self.sut.failureDidFetchImage(model: PlaceDetailsModels.PhotoModel(), error: .noDataAvailable)
        XCTAssertTrue(self.presenterSpy.presentDidFetchImageCalled)
    }
    
    // MARK: - Select photo tests
    
    func testShouldSelectPhotoShouldAskThePresenterToPresentNavigateToFullscreenImage() {
        self.sut.shouldSelectPhoto()
        XCTAssertTrue(self.presenterSpy.presentNavigateToFullscreenImageCalled)
    }
    
    // MARK: - Share place tests
    
    func testShouldSharePlaceShouldAskThePresenterToPresentSharePlace() {
        self.sut.shouldSharePlace()
        XCTAssertTrue(self.presenterSpy.presentSharePlaceCalled)
    }
    
    // MARK: - Place comments navigation tests
    
    func testShouldNavigateToPlaceCommentsShouldAskThePresenterToPresentNavigateToPlaceComments() {
        self.sut.shouldNavigateToPlaceComments()
        XCTAssertTrue(self.presenterSpy.presentNavigateToPlaceCommentsCalled)
    }
}
