//
//  ICache.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/1/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

protocol ICache {
    func setCredentials(_ credentials: Credentials) -> Bool
    func getCredentials() -> Credentials?
}
