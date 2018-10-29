//
//  AuthenticateCustomerReqMessage.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/26/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

class AuthenticateCustomerReqMessage: Codable {
    
    var apiUser: String = ""
    var apiPassword: String
    var channelPartnerID: String = "MOBINAPP1"
    var contactUserName: String = "inapptest02@yopmail.com"
    var contactPassword: String
    
    init(_ apiUser: String, _ apiPassword: String) {
        self.apiUser = apiUser
        self.apiPassword = apiPassword
        self.contactPassword = apiPassword
    }
}
