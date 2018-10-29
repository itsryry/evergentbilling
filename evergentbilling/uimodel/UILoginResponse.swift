//
//  UILoginResponse.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/20/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

enum LoginStatus {
    case SUCCESS, FAIL
}

class UILoginResponse {
    var status: LoginStatus
    
    init(_ status: LoginStatus) {
        self.status = status
    }
}
