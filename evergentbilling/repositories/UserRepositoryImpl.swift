//
//  UserRepository.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/20/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

class UserRepositoryImpl: IUserRepository {
    let url = "https://rest-dev.evergent.com/ev/authenticateCustomer"
    
    func login(request: LoginRequest) -> Single<UILoginResponse> {
        return RxAlamofire.requestJSON(.post, url)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
        .debug()
            .flatMap { data -> Single<UILoginResponse> in
                return UserTranslator.shared().translateLoginResponse(response: data)
            }
    }
}
 
