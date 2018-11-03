//
//  Session.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/1/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

protocol ISession {
    func setUsername(_ username: String) -> Bool
    func getUsername() -> String
    func setPassword(_ password: String) -> Bool
    func getPassword() -> String
    func setChannelPartnerID(_ channelPartnerId: String) -> Bool
    func getChannelPartnerID() -> String
    func setDmaID(_ dmaID: String) -> Bool
    func getDmaID() -> String
}
