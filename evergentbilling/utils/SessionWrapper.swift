//
//  CredentialsWrapper.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/1/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class SessionWrapper: ISession {
    
    private static var wrapper = SessionWrapper()
    private init() {}
    
    class func shared() -> SessionWrapper {
        return wrapper
    }
    
    static let uniqueServiceName = "loginService"
    static let uniqueAccessGroup = "evergentGroup"
    let customKeychainWrapperInstance = KeychainWrapper(serviceName: uniqueServiceName, accessGroup: uniqueAccessGroup)
    
    func setUsername(_ username: String) -> Bool {
        customKeychainWrapperInstance.set(LoginResponse(), forKey: "username")
        return customKeychainWrapperInstance.set(username, forKey: "username")
    }
    
    func getUsername() -> String {
        return customKeychainWrapperInstance.string(forKey: "username")!
    }
    
    func setPassword(_ password: String) -> Bool {
        return customKeychainWrapperInstance.set(password, forKey: "password")
    }
    
    func getPassword() -> String {
        return customKeychainWrapperInstance.string(forKey: "password")!
    }
    
    func setChannelPartnerID(_ channelPartnerId: String) -> Bool {
        return customKeychainWrapperInstance.set(channelPartnerId, forKey: "channelPartnerId")
    }
    
    func getChannelPartnerID() -> String {
        return customKeychainWrapperInstance.string(forKey: "channelPartnerId")!
    }
    
    func setDmaID(_ dmaID: String) -> Bool {
        return customKeychainWrapperInstance.set(channelPartnerId, forKey: "dmaID")
    }
    
    func getDmaID() -> String {
        return customKeychainWrapperInstance.string(forKey: "dmaID")!
    }
}
