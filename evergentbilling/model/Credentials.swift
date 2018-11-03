//
//  SessionCache.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/2/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import CodableKeychain

class Credentials: KeychainStorable {
    
    init() {
        self.apiUser = ""
        self.apiPassword = ""
        self.channelPartnerID = ""
        self.dmaID = ""
    }
    
    var account: String { return EvergentCache.DEFAULT_CREDENTIALS }
    
    var apiUser, apiPassword, channelPartnerID, dmaID: String
}
