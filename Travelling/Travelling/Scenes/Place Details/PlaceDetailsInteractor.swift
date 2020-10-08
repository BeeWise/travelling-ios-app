//
//  PlaceDetailsInteractor.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PlaceDetailsBusinessLogic {
    
}

class PlaceDetailsInteractor: PlaceDetailsBusinessLogic {
    var presenter: PlaceDetailsPresentationLogic?
    var worker: PlaceDetailsWorker?
    
    init() {
        self.worker = PlaceDetailsWorker(delegate: self)
    }
}

extension PlaceDetailsInteractor: PlaceDetailsWorkerDelegate {
    
}