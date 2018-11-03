//
//  UIProduct.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/1/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

struct UIProducts {
    var status: ApiStatus
    var products: [UIProduct]
    
    init (_ status: ApiStatus, _ products: [UIProduct]) {
        self.status = status
        self.products = products
    }
}

struct UIProduct {
    var name: String
    var price: String
    var type: String
    var sku: String
}
