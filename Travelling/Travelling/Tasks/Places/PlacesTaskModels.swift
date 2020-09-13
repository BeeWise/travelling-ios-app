//
//  PlacesTaskModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

public enum PlacesTaskModels {
    public enum Fetch {
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
}
