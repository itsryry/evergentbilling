//
//  LoginPresenter.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/2/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import RxSwift

class LoginPresenter: ILoginPresenter {
    
    var userRepository: IUserRepository = UserRepositoryImpl()
    var disposables: DisposeBag = DisposeBag()
    var loginView: ILoginView
    
    init(_ loginView: ILoginView) {
        self.loginView = loginView
    }
    
    func login(_ username: String, _ password: String) {
        let request = LoginRequest(username, password)
        
        loginView.showLoading()
        
        userRepository.login(request)
            .subscribe(onNext: { response in
                self.loginView.hideLoading()
                switch response.status {
                case .SUCCESS:
                    self.loginView.navigateToProductList()
                case .FAIL:
                    self.loginView.clearPassword()
                    self.loginView.showAlert(title: "Error", message: "Login has failed.")
                }
            },
            onError: { error in
                self.loginView.showAlert(title: "Error", message: error.localizedDescription)
            })
            .disposed(by: disposables)
    }
    
    
    func validField(_ field: String, _ message:String) -> String? {
        if field != "" {
            return field
        }
        self.loginView.showAlert(title: "Error!", message: message)
        return nil
    }
}
