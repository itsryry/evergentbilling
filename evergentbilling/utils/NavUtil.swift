//
//  NavUtil.swift
//  evergentbilling
//
//  Created by Aminul Hasan on 10/13/18.
//  Copyright © 2018 Evergent. All rights reserved.
//

import Foundation

public class NavUtil {
    
    static let activityIndicatorOverlayViewTag = 1
    static let activityIndicatorViewTag = 2
    
    public static func getProductVC() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle(for: self))
        let homeVC = storyboard.instantiateViewController(withIdentifier: "MasterProductList")
        return homeVC
    }
    
    static func showActivityIndicator(view: UIView, withOpaqueOverlay: Bool) {
        
        // this will be the alignment view for the activity indicator
        var superView: UIView = view
        
        // if we want an opaque overlay, do that work first then put the activity indicator within that view; else just use the passed UIView to center it
        if withOpaqueOverlay {
            let overlay = UIView()
            overlay.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
            overlay.layer.backgroundColor = UIColor.black.cgColor
            overlay.alpha = 0.7
            overlay.tag = activityIndicatorOverlayViewTag
            
            overlay.center = superView.center
            overlay.isHidden = false
            superView.addSubview(overlay)
            superView.bringSubview(toFront: overlay)
            
            // now we'll work on adding the indicator to the overlay (now superView)
            superView = overlay
        }
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        
        indicator.center = superView.center
        indicator.tag = activityIndicatorViewTag
        indicator.isHidden = false
        
        superView.addSubview(indicator)
        superView.bringSubview(toFront: indicator)
        
        indicator.startAnimating()
        
        // also indicate network activity in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    static func hideActivityIndicator(view: UIView) {
        
        // stop the network activity animation in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        // remove the activity indicator and optional overlay views
        view.viewWithTag(activityIndicatorViewTag)?.removeFromSuperview()
        view.viewWithTag(activityIndicatorOverlayViewTag)?.removeFromSuperview()
    }
}
