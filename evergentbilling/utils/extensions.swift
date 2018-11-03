//
//  extensions.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/27/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

import Foundation

extension Data
{
    func toString() -> String {
        return String(data: self, encoding: .utf8)!
    }
}
