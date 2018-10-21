//
//  UserTranslator.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/20/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

class UserTranslator {
    
    private static var translator = UserTranslator()
    
    private init() { }
    
    class func shared() -> UserTranslator {
        return translator
    }
    
    func translateLoginResponse(response: (HTTPURLResponse, Any)) -> UILoginResponse {
        return UILoginResponse()
    }
}
