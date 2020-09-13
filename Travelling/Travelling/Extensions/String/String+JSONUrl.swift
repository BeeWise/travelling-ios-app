//
//  String+JSONUrl.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

extension String {
    func jsonURL() -> URL? {
        return Bundle.main.url(forResource: self, withExtension: "json")
    }
}
