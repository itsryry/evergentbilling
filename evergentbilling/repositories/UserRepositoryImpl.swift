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

    let cache: ICache = EvergentCache.shared()
    private var decoder = JSONDecoder()
    
    func login(_ loginRequest: LoginRequest) -> Observable<UILoginResponse> {
        var request = createBaseRequest(url: EvergentURLs.loginUrl)
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(loginRequest)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            print(json ?? "Could not json encode the request object.")
            request.httpBody = jsonData
        } catch {
            print("error encoding json", error)
        } 

        return RxAlamofire.request(request).responseJSON()
            .observeOn(MainScheduler.instance)
            .debug()
            .flatMap { apiData -> Observable<UILoginResponse> in
                let data = try self.decoder.decode(LoginResponse.self, from: apiData.data!)
                // TODO: Move this to login use case class
                let uiResponse = UserTranslator.shared().translateLoginResponse(response: data)
                let credentials = Credentials()
                credentials.apiUser = loginRequest.customer.apiUser
                credentials.apiPassword = loginRequest.customer.apiPassword
                credentials.channelPartnerID = data.response.channelPartnerID
                credentials.dmaID = data.response.dmaID
                _ = self.cache.setCredentials(credentials)
                return Single.just(uiResponse).asObservable()
            }.catchErrorJustReturn(UILoginResponse(ApiStatus.FAIL))
    }
    
    func getProducts() -> Observable<UIProducts> {
        let credentials = cache.getCredentials()
        do {
            if let creds = credentials {
                let packageRequest = GetPackagesRequestMessage(apiUser: creds.apiUser, apiPassword: creds.apiPassword, channelPartnerID: creds.channelPartnerID, dmaID: creds.dmaID)
                let productRequest = EvergentProductsRequest(getPackagesRequestMessage: packageRequest)
                
                var request = createBaseRequest(url: EvergentURLs.productsUrl)

                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(productRequest)
                let json = String(data: jsonData, encoding: String.Encoding.utf8)
                print(json ?? "Could not json encode the request object.")
                request.httpBody = jsonData
                
                return RxAlamofire.request(request).responseJSON()
                    .observeOn(MainScheduler.instance)
                    .debug()
                    .flatMap { apiData -> Observable<UIProducts> in
                        let data = try self.decoder.decode(EvergentProductsResponse.self, from: apiData.data!)
                        let uiResponse = UserTranslator.shared().translateProductsResponse(response: data)
                        return Single.just(uiResponse).asObservable()
                    }
            }
        } catch {
            print("error encoding json", error)
        }
        return Observable.just(UIProducts(ApiStatus.FAIL, []))
    }
    
    private func createBaseRequest(_ method: String? = HTTPMethod.post.rawValue, url: String) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}

