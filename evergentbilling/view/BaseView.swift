//
//  BaseView.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 11/2/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

protocol BaseView {
    func showAlert(title: String, message: String)
    func showLoading()
    func hideLoading()
}
