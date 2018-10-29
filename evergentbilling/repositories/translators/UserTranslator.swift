//
//  UserTranslator.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/20/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import Alamofire

class UserTranslator {
    
    private static var translator = UserTranslator()
    private var decoder = JSONDecoder()

    private init() { }
    
    class func shared() -> UserTranslator {
        return translator
    }
    
    func translateLoginResponse(response: DataResponse<Any>) -> UILoginResponse {
        do {
            let parsedData = try decoder.decode(LoginResponse.self, from: response.data!)
            if (parsedData.response.status == "SUCCESS") {
                return UILoginResponse(LoginStatus.SUCCESS)
            }
        } catch {
            return UILoginResponse(LoginStatus.FAIL)
        }
        return UILoginResponse(LoginStatus.FAIL)
    }
}
