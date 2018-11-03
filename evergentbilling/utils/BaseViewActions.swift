//
//  BaseViewActions.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/2/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

class BaseViewActions: BaseView {
    
    weak var controller: UIViewController? = nil
    
    init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.controller?.present(alertController, animated: true, completion: nil)
    }
    
    func showLoading() {
        NavUtil.showActivityIndicator(view: (self.controller?.view)!, withOpaqueOverlay: true)
        
    }
    
    func hideLoading() {
        NavUtil.hideActivityIndicator(view: (self.controller?.view)!)
    }
    
}
