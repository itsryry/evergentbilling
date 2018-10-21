//
//  NavUtil.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/13/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

public class NavUtil {
    
    public static func getProductVC() -> UIViewController {
        
        let storyboard = UIStoryboard.init(name: "Storyboard", bundle: Bundle(for: self))
        let homeVC = storyboard.instantiateViewController(withIdentifier: "ProductNavigationController")
        return homeVC
    }
    
}
