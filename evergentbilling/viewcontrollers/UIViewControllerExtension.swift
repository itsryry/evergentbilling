//
//  BaseController.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/2/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: BaseView {
    
    var baseViewDelegate: BaseView {
        get {
            return BaseViewActions(self)
        }
    }
    
    func showAlert(title: String, message: String) {
        self.baseViewDelegate.showAlert(title: title, message: message)
    }
    
    func showLoading() {
        self.baseViewDelegate.showLoading()
    }
    
    func hideLoading() {
        self.baseViewDelegate.hideLoading()
    }
    
}
