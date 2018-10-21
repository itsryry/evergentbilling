//
//  ProductListController.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/9/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import UIKit

class ProductListController: UIViewController {
    
    override func viewDidLoad() {
        ProductRepository.store.requestProducts{ [weak self] success, products in
            guard case self = self else { return }
            if success {
                print("Success")
                print(products ?? "No Products!")
            } else {
                print("Failed to load products")
            }
        }
    }
    
}
