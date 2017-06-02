//
//  NavigationBarAttribute.swift
//  Pods
//
//  Created by Nikolay Shubenkov on 01/06/2017.
//
//

import UIKit

public enum NavigationBarAttribute {

    case titleFont(UIFont)
    case titleColor(UIColor)
    case barButtonTitleFont(UIFont)
    case barButtonTitleColor(UIColor)
    case backgroundImage(UIImage?)
    case backgroundColor(UIColor)
    case showShadow(Bool)
    case backButton(String?,UIImage?)
    case hideBackButtonTitle
    case transculent(Bool)
    case transparent//transparent, no shadow
    case plainColor(UIColor)//solid color, no shadow
}
