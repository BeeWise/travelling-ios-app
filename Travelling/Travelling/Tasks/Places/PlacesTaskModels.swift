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
            let userId: String?
            let page: Int
            let limit: Int
            
            init(userId: String? = nil, page: Int, limit: Int) {
                self.userId = userId
                self.page = page
                self.limit = limit
            }
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
