//
//  LoginRequest.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/20/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

class LoginRequest: Codable {

    var customer: AuthenticateCustomerReqMessage

    init(_ username: String, _ password: String) {
        customer = AuthenticateCustomerReqMessage(username, password)
    }
    
    enum CodingKeys: String, CodingKey {
        case customer = "AuthenticateCustomerReqMessage"
    }
}
