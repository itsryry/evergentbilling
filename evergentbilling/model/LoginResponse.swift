//
//  LoginResponse.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/20/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

class LoginResponse: Codable {
    var response: AuthenticateCustomerRespMessage
    
    init(_ response: AuthenticateCustomerRespMessage) {
        self.response = response
    }
    
    enum CodingKeys: String, CodingKey {
        case response = "AuthenticateCustomerRespMessage"
    }
}
