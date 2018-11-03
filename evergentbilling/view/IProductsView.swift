//
//  IProductsView.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/3/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

protocol IProductsView: BaseView {
    func reloadTable(products: [UIProduct])
    func endRefreshing()
}
