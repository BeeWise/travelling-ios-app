//
//  MainBusinessLogicSpy.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling

class MainBusinessLogicSpy: MainBusinessLogic {
    var shouldSelectScene: Bool = false
    var shouldSelectSceneCalled: Bool = false
    
    var shouldSetupScenesCalled: Bool = false
    var shouldSelectInitialSceneCalled: Bool = false
    
    var shouldNavigateToOnboardingCalled: Bool = false
    
    func shouldSetupScenes() {
        self.shouldSetupScenesCalled = true
    }
    
    func shouldSelectInitialScene() {
        self.shouldSelectInitialSceneCalled = true
    }
    
    func shouldSelectScene(index: Int) -> Bool {
        self.shouldSelectSceneCalled = true
        return self.shouldSelectScene
    }
    
    func shouldNavigateToOnboarding(request: MainModels.OnboardingNavigation.Request) {
        self.shouldNavigateToOnboardingCalled = true
    }
}
