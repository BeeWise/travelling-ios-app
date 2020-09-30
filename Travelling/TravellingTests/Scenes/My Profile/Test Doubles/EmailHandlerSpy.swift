//
//  EmailHandlerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

@testable import Travelling
import Foundation

class EmailHandlerSpy: EmailHandler {
    var canSendEmailValue: Bool = false
    
    override var canSendEmail: Bool {
        return self.canSendEmailValue
    }
}
