//
//  IProductPresenter.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/3/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

protocol IProductPresenter {
    func showProducts()
    func isStorePurchased(_ sku: String) -> Bool
    func restorePurchases()
    func getCurrentProducts() -> [UIProduct]
}
