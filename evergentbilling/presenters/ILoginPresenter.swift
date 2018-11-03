//
//  LoginPresenter.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/2/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

protocol ILoginPresenter {
    func login(_ username: String, _ password: String)
    func validField(_ field: String, _ message:String) -> String?
}
