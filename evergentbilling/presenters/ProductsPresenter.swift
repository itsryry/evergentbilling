//
//  ProductsPresenter.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/3/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import RxSwift

class ProductsPresenter: IProductPresenter {
    
    var productsView: IProductsView
    var userRepository: IUserRepository = UserRepositoryImpl()
    var disposables: DisposeBag = DisposeBag()
    var products: [UIProduct]
    
    init(_ productsView: IProductsView) {
        self.productsView = productsView
        self.products = []
    }
    
    func showProducts() {
        userRepository.getProducts().subscribe(onNext: { response in
            self.products = response.products
            self.productsView.reloadTable(products: response.products)
            self.productsView.endRefreshing()
        }, onError: { error in
            self.productsView.endRefreshing()
            self.productsView.showAlert(title: "Error", message: error.localizedDescription)
        }).disposed(by: disposables)
    }
    
    func isStorePurchased(_ sku: String) -> Bool {
        return StoreRepository.store.isProductPurchased(sku)
    }
    
    func getCurrentProducts() -> [UIProduct] {
        return self.products
    }
    
    func restorePurchases() {
        StoreRepository.store.restorePurchases()
    }
}
