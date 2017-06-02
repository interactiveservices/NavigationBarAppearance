//
//  ViewController.swift
//  IASNavigationController
//
//  Created by nikolay.shubenkov@gmail.com on 06/01/2017.
//  Copyright (c) 2017 nikolay.shubenkov@gmail.com. All rights reserved.
//

import UIKit
import NavigationBarAppearance

class ConfigurableViewController: UIViewController, NavigationBarCustomizer {
    
    var hasCustomBackButton = false
    var navigationBarAttributes:[NavigationBarAttribute]? = []

    
    convenience init(attributes:[NavigationBarAttribute]?){
        self.init()
        navigationBarAttributes = attributes
    }
    
}

