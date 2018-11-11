//
//  ProductsPresenter.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/3/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import RxSwift
import StoreKit

class ProductsPresenter: IProductPresenter {
    
    var productsView: IProductsView
    var userRepository: IUserRepository = UserRepositoryImpl()
    var disposables: DisposeBag = DisposeBag()
    var uiProducts: [UIProduct]
    var skProducts: [SKProduct]? = nil
    
    init(_ productsView: IProductsView) {
        self.productsView = productsView
        self.uiProducts = []
        self.skProducts = []
    }
    
    func showProducts() {
        StoreRepository.store.requestProducts { result, products in
            switch (result) {
            case true:
                if (!(products?.isEmpty)!) {
                    self.skProducts = products
                    self.userRepository.getProducts().subscribe(onNext: { response in
                        self.uiProducts = response.products
                        self.productsView.reloadTable(products: response.products)
                        self.productsView.endRefreshing()
                    }, onError: { error in
                        self.productsView.endRefreshing()
                        self.productsView.showAlert(title: "Error", message: "Could not get products from Evergent due to: \n" + error.localizedDescription)
                    }).disposed(by: self.disposables)
                }
            case false:
                self.productsView.endRefreshing()
                self.productsView.showAlert(title: "Error", message: "Could not get products from app store.")
            }
        }
    }
    
    func isStorePurchased(_ sku: String) -> Bool {
        return StoreRepository.store.isProductPurchased(sku)
    }
    
    func getCurrentProducts() -> [UIProduct] {
        return self.uiProducts
    }
    
    func restorePurchases() {
        StoreRepository.store.restorePurchases()
    }
    
    
    func buyProduct(sku: String) {
        if let skProduct = getSkProductFor(sku: sku) {
            StoreRepository.store.buyProduct(skProduct)
        } else {
            self.productsView.showAlert(title: "Error", message: "Cannot find matching evergent product in app store.")
        }
    }
    
    func getSkProductFor(sku: String) -> SKProduct? {
        return skProducts?.filter { skProduct in
            skProduct.productIdentifier == sku
        }.first ?? nil
    }
}
