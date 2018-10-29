//
//  AuthenticateCustomerRespMessage.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/26/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

class AuthenticateCustomerRespMessage: Codable {
    
    var status: String
    var tokenExpiryTime: String
    var responseCode: String
    var lastName: String
    var channelPartnerID: String
    var cpCustomerID: String
    var dmaID: String
    var message: String
    var isPrimaryContact: String
    var sessionToken: String
    var channelPartner: String
    var contactID: String
    var accountStatus: String
    var name: String
    var firstName: String
    
    init(_ status: String) {
        self.status = status
        self.tokenExpiryTime = ""
        self.responseCode = ""
        self.accountStatus = ""
        self.lastName = ""
        self.channelPartnerID = ""
        self.dmaID = ""
        self.message = ""
        self.isPrimaryContact = ""
        self.sessionToken = ""
        self.channelPartner = ""
        self.contactID = ""
        self.accountStatus = ""
        self.name = ""
        self.firstName = ""
        self.cpCustomerID = ""
    }
}
