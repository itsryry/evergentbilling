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
import Alamofire

class UserRepositoryImpl: IUserRepository {
    let url = "https://rest-dev.evergent.com/ev/authenticateCustomer"
    
    func login(_ loginRequest: LoginRequest) -> Observable<UILoginResponse> {
        var request = URLRequest(url: URL(string: self.url)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(loginRequest)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            print(json ?? "Could not json encode the request object.")
            
            request.httpBody = jsonData
        } catch {
            print("error encoding json")
        }
        return RxAlamofire.request(request).responseJSON()
            .observeOn(MainScheduler.instance)
            .debug()
            .flatMap { data -> Observable<UILoginResponse> in
                Single.just(UserTranslator.shared().translateLoginResponse(response: data)).asObservable()
            }
    }
}

