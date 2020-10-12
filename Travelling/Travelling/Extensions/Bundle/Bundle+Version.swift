//
//  Bundle+Version.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 27/09/2020.
//

import Foundation

extension Bundle {
    var versionNumber: String {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    var applicationName: String {
        return self.infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
