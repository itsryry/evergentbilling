//
//  UserRepository.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/20/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import RxSwift

protocol IUserRepository {
    func login(_ loginRequest: LoginRequest) -> Observable<UILoginResponse>
}
