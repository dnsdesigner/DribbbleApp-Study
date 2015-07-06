//
//  AppDelegate.swift
//  DribbbleApp
//
//  Created by Dennis de Oliveira on 6/29/15
//  Copyright (c) 2015 Dennis Oliveira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        // Setando cor de fundo da barra para laranja
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = UIColor(red:0.95, green:0.40, blue:0.60, alpha:1.0)
        
        // Setando cor do texto e tint color para branco
        let attrs = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        appearance.titleTextAttributes = attrs
        appearance.tintColor = UIColor.whiteColor()
        
        return true
    }
}
