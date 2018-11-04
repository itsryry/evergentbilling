//
//  IProductPresenter.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/3/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import StoreKit

protocol IProductPresenter {
    func showProducts()
    func isStorePurchased(_ sku: String) -> Bool
    func restorePurchases()
    func getCurrentProducts() -> [UIProduct]
    func getSkProductFor(sku: String) -> SKProduct?
    func buyProduct(sku: String)
}
