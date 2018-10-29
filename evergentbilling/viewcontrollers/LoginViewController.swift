//
//  LoginViewController.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/19/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var userRepository: IUserRepository = UserRepositoryImpl()
    var disposables: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        loginField.text = "inappapi"
//        passwordField.text = "pa$$word1"
        self.title = "Login"
    }
    
    func validField(_ field:UITextField, _ message:String) -> String?
    {
        if let fieldValue = field.text, fieldValue != ""
        { return fieldValue }
        OperationQueue.main.addOperation
            { self.showAlert(title: "Error!", message: message) }
        return nil
    }
    
    // TODO: Move api call & logic inside view model
    @IBAction func onLoginPressed(_ sender: Any) {
        guard let username  = validField(loginField, "Username is required. Please enter your username"),
            let password = validField(passwordField,"Password is required. Please enter your password")
            else  { return }
        
            // proceed with valid data ...
            let request = LoginRequest(username, password)
        
        NavUtil.showActivityIndicator(view: self.view, withOpaqueOverlay: true)
        userRepository.login(request)
            .subscribe(onNext: { response in
                NavUtil.hideActivityIndicator(view: self.view)
                switch response.status {
                case .SUCCESS:
                    self.navigationController?.pushViewController(NavUtil.getProductVC(), animated: true)
                case .FAIL:
                    self.showAlert(title: "Error", message: "Login has failed.")
                    self.passwordField.text = ""
                }
            },
            onError: { error in
                self.showAlert(title: "Error", message: error.localizedDescription)
            })
            .disposed(by: disposables)
    }
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
