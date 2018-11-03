//
//  AuthenticateCustomerReqMessage.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/26/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

struct EvergentProductsRequest: Codable {
    let getPackagesRequestMessage: GetPackagesRequestMessage
    
    enum CodingKeys: String, CodingKey {
        case getPackagesRequestMessage = "GetPackagesRequestMessage"
    }
}

struct GetPackagesRequestMessage: Codable {
    let apiUser, apiPassword, channelPartnerID, dmaID: String
    let returnAppChannels: String = "T"
}
