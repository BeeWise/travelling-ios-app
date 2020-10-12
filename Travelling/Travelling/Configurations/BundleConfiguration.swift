//
//  BundleConfiguration.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 27/09/2020.
//

import Foundation

enum BundleConfiguration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }
        switch object {
            case let value as T:
                return value
            case let string as String:
                guard let value = T(string) else { fallthrough }
                return value
            default:
                throw Error.invalidValue
        }
    }
    
    static func string(for key: String, defaultValue: String = "") -> String {
        do {
            return try BundleConfiguration.value(for: key)
        } catch {
            return defaultValue
        }
    }
    
    struct Keys {
        static let
        taskConfiguratorEnvironment = "TASK_CONFIGURATOR_ENVIRONMENT",
        reportIssueRecipientEmail = "REPORT_ISSUE_RECIPIENT_EMAIL",
        appStoreUrl = "APP_STORE_URL"
    }
}
