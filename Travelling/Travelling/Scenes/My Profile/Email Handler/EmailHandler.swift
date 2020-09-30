//
//  EmailHandler.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation
import MessageUI

class EmailHandler {
    var canSendEmail: Bool {
        return MFMailComposeViewController.canSendMail()
    }
}
