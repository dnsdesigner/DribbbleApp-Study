//
//  CustomNavigationController.swift
//  DribbbleApp
//
//  Created by Dennis de Oliveira on 29/06/15.
//  Copyright (c) 2015 Dennis Oliveira. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    // Deixar a status bar branca
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
