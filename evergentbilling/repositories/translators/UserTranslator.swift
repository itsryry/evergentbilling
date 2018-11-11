//
//  UserTranslator.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/20/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import Alamofire

class UserTranslator {
    
    private static var translator = UserTranslator()
    private init() { }
    
    class func shared() -> UserTranslator {
        return translator
    }
    
    let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency
        
        return formatter
    }()
    
    func translateLoginResponse(response: LoginResponse) -> UILoginResponse {
        if (response.response.status == "SUCCESS") {
            return UILoginResponse(ApiStatus.SUCCESS)
        }
        return UILoginResponse(ApiStatus.FAIL)
    }
    
    func translateProductsResponse(response: EvergentProductsResponse) -> UIProducts {
        var uiProducts = UIProducts(ApiStatus.FAIL, [])

        let parsedData = response
        if (parsedData.getPackagesResponseMessage.message == "SUCCESS") {
            uiProducts.status = ApiStatus.SUCCESS
        }

        for product in parsedData.getPackagesResponseMessage.packagesResponseMessage {
            priceFormatter.currencyCode = product.currencyCode
            let uiProduct = UIProduct(name: product.appChannels[0].appName, price: priceFormatter.string(for: product.retailPrice)!, type: product.displayName, sku: product.appChannels[0].appID)
            uiProducts.products.append(uiProduct)
        }

        return uiProducts
    }
}
