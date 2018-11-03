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

class LoginViewController: UIViewController, ILoginView {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var presenter: ILoginPresenter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginField.text = "inappapi"
        passwordField.text = "pa$$word1"
        self.title = "Login"
        
        self.presenter = LoginPresenter(self)
    }
    
    @IBAction func onLoginPressed(_ sender: Any) {
        guard let username  = self.presenter?.validField((loginField?.text)!, "Username is required. Please enter your username"),
            let password = self.presenter?.validField((passwordField?.text)!,"Password is required. Please enter your password")
            else  { return }
        presenter?.login(username, password)
    }
    
    func clearPassword() {
        self.passwordField.text = ""
    }
    
    func navigateToProductList() {
        self.navigationController?.pushViewController(NavUtil.getProductVC(), animated: true)
    }
}
