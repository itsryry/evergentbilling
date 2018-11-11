// To parse the JSON, add this file to your project and do:
//
//   let evergentProductsResponse = try? newJSONDecoder().decode(EvergentProductsResponse.self, from: jsonData)

import Foundation

struct EvergentProductsResponse: Codable {
    let getPackagesResponseMessage: GetPackagesResponseMessage
    
    enum CodingKeys: String, CodingKey {
        case getPackagesResponseMessage = "GetPackagesResponseMessage"
    }
}

struct GetPackagesResponseMessage: Codable {
    let message, responseCode: String
    let packagesResponseMessage: [PackagesResponseMessage]
}

struct PackagesResponseMessage: Codable {
    let packageItems: PackageItems
    let dmaName, duration: String
    let retailPrice: Double
    let bbDescription, currencyCode, packageName: String
    let renewable: Bool
    let period, displayName: String
    let appChannels: [AppChannel]
    let skuORQuickCode: String
    let basicService: Bool
    
    enum CodingKeys: String, CodingKey {
        case packageItems = "PackageItems"
        case dmaName, duration, retailPrice, bbDescription, currencyCode, packageName, renewable, period, displayName, appChannels, skuORQuickCode, basicService
    }
}

struct AppChannel: Codable {
    let appName, appChannel, appID: String
}

struct PackageItems: Codable {
    let item: [Item]
}

struct Item: Codable {
    let skuOrCode: String
    let isPackage: Bool
    let name: String
}
