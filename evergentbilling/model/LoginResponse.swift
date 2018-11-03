//
//  LoginResponse.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/20/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import CodableKeychain

class LoginResponse: KeychainStorable {
    var response: AuthenticateCustomerRespMessage
    
    init(_ response: AuthenticateCustomerRespMessage) {
        self.response = response
    }
    
    init(_ status: String) {
        self.response = AuthenticateCustomerRespMessage(status)
    }
    
    enum CodingKeys: String, CodingKey {
        case response = "AuthenticateCustomerRespMessage"
    }
}

extension LoginResponse {
    
    var account: String { return response.firstName }
    var accessible: Keychain.AccessibleOption { return .whenPasscodeSetThisDeviceOnly }
    
}
