//
//  Cache.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/1/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import CodableKeychain

class EvergentCache: ICache {
    static let DEFAULT_CREDENTIALS = "default_credentials"
    private static var cache = EvergentCache()
    private init() {
        Keychain.configureDefaults()
    }
    
    class func shared() -> EvergentCache {
        return cache
    }

    func setCredentials(_ credentials: Credentials) -> Bool {
        do {
            try Keychain.default.store(credentials)
            return true
        } catch let error {
            print(error)
        }
        return false
    }
    
    func getCredentials() -> Credentials? {
        do {
            let credential: Credentials? = try Keychain.default.retrieveValue(forAccount: EvergentCache.DEFAULT_CREDENTIALS)
            return credential
        } catch let error {
            print(error)
        }
        
        return nil
    }
}
