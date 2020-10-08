//
//  PlacesTaskModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//

import Foundation

public enum PlacesTaskModels {
    public enum FetchPlaces {
        public struct Request {
            let page: Int
            let limit: Int
        }
        
        public struct Response {
            let places: [Place]
            let page: Int
            let limit: Int
        }
    }
    
    public enum FetchPlace {
        public struct Request {
            let placeId: String?
        }
        
        public struct Response {
            let place: Place
        }
    }
}
