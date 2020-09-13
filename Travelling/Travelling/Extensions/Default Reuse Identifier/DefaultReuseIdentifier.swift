//
//  DefaultReuseIdentifier.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

public protocol DefaultReuseIdentifier: class {
    static var defaultReuseIdentifier: String { get }
}

extension DefaultReuseIdentifier {
    public static var defaultReuseIdentifier: String {
        get {
            return String(describing: self)
        }
    }
}
