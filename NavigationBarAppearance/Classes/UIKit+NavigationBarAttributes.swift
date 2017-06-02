//
//  UIViewController+NavigationBarAttribute.swift
//  Pods
//
//  Created by Nikolay Shubenkov on 01/06/2017.
//
//

import UIKit

public protocol NavigationBarCustomizable {
    func apply(attribute:NavigationBarAttribute)
}

public extension NavigationBarCustomizable {
    func apply(attributes:[NavigationBarAttribute]){
        attributes.forEach{ self.apply(attribute: $0) }
    }
}

public protocol NavigationBarCustomizer: NavigationBarCustomizable {
    // Possibly rename this to 'setupBackButtonMyself'
    var hasCustomBackButton:Bool {get}
    var navigationBarAttributes:[NavigationBarAttribute]? {get}
}

extension UIViewController:NavigationBarCustomizable {
    
    open func apply(attribute:NavigationBarAttribute){
        guard let navigationBar = self.navigationController?.navigationBar else {
            return
        }
        
        switch attribute
        {
        case .backgroundImage, .backgroundColor, .titleColor, .titleFont, .showShadow, .transculent, .plainColor, .transparent:
            navigationBar.apply(attribute: attribute)
            
        case .backButton(let title, let image):
            
            if (self as? NavigationBarCustomizer)?.hasCustomBackButton ?? false ||
                self.navigationItem.hidesBackButton {
                return
            }
            
            guard let myIndexInNavigationStack = self.navigationController?.viewControllers.index(of: self),
                myIndexInNavigationStack > 0 else {
                    return
            }
            
            let btn = UIButton()
            btn.tag = 87675
            btn.setImage(image, for: .normal)
            btn.setTitle(title, for: .normal)
            btn.sizeToFit()
            btn.addTarget(self.navigationController,
                          action: #selector(UINavigationController.popViewController(animated:)),
                          for: .touchUpInside)
            
            let item = UIBarButtonItem(customView: btn)
            item.target = self.navigationController
            self.navigationItem.leftBarButtonItem = item
            
        case .hideBackButtonTitle:
            
            if !self.navigationItem.hidesBackButton,
                let item = self.navigationItem.leftBarButtonItem,
                let index = self.navigationController?.viewControllers.index(of: self),
                index > 0{
                item.title = nil
                (item.customView as? UIButton)?.setTitle(nil, for: .normal)
            }
            
        case .barButtonTitleColor, .barButtonTitleFont:
            updateNavigationItems(with: attribute)
        }
    }
    
    private func updateNavigationItems(with attribute:NavigationBarAttribute, state:UIControlState = .normal){
        
        [self.navigationItem.leftBarButtonItems,self.navigationItem.rightBarButtonItems]
            .flatMap{$0}
            .forEach{
                $0.forEach{ item in
                    item.apply(attribute: attribute)
                }
        }
    }
}

extension UINavigationBar:NavigationBarCustomizable {
    
    open func apply(attribute: NavigationBarAttribute) {
        switch attribute {
            
        case .backgroundImage(let image):
            setBackgroundImage(image, for: .default)
            
        case .backgroundColor(let color):
            backgroundColor = color
            barTintColor = color
            
        case .titleColor(let color):
            updateTitle(with: [NSForegroundColorAttributeName:color])
            
        case .titleFont(let font):
            updateTitle(with: [NSFontAttributeName:font])
            
        case .showShadow(let show):
            shadowImage = show ? nil :UIImage.imageOf(color: .clear)
            
        case .transculent(let transculent):
            isTranslucent = transculent
            
        case .plainColor(let color):
            let image = UIImage.imageOf(color: color)
            
            apply(attributes: [NavigationBarAttribute.transculent(false),
                               NavigationBarAttribute.showShadow(false),
                               NavigationBarAttribute.backgroundImage(image),
                               NavigationBarAttribute.backgroundColor(color),
                               NavigationBarAttribute.transculent(false)])
            
        case .transparent:
            apply(attributes: [NavigationBarAttribute.plainColor(.clear),
                               NavigationBarAttribute.transculent(true)])
            
        case .backButton, .barButtonTitleColor, .barButtonTitleFont, .hideBackButtonTitle:
            assert(false, "should not apply attribute: \(attribute) to \(self)")
            
        }
    }
    
    private func updateTitle(with attributes:[String:Any]){
        var attributesToUpdate = self.titleTextAttributes ?? [String:Any]()
        for (key, value) in attributes {
            attributesToUpdate[key] = value
        }
        self.titleTextAttributes = attributesToUpdate
    }
}

extension UIBarButtonItem:NavigationBarCustomizable {
    open func apply(attribute: NavigationBarAttribute) {
        
        switch attribute {
            
        case .barButtonTitleColor(let color):
            updateAttributes(with: [NSForegroundColorAttributeName:color])
            
        case .barButtonTitleFont(let font):
            updateAttributes(with: [NSFontAttributeName : font])
            
        default:
            assert(false, "should not apply attribute :\(attribute) to: \(self)")
        }
    }
    
    private func updateAttributes(with attributes:[String:Any], state:UIControlState = .normal){
        
        var textAttributes = self.titleTextAttributes(for: state) ?? [String:Any]()
        
        for (key,value) in attributes{
            textAttributes[key] = value
            self.setTitleTextAttributes(textAttributes, for: state)
        }
        
        //HACK. For custom back button UIButton used as custom view
        if let btn = self.customView as? UIButton,
            btn.tag == 87675{
            
            //update attributes if presented
            if  let attributedTitle = btn.attributedTitle(for:state) {
                let titleToChange = NSMutableAttributedString(attributedString: attributedTitle)
                titleToChange.addAttributes(attributes, range: NSMakeRange(0, titleToChange.string.characters.count))
                btn.setAttributedTitle(titleToChange, for: state)
            }
            
            //updated manually
            if let font = attributes[NSFontAttributeName] as? UIFont {
                btn.titleLabel?.font = font
            }
            if let color = attributes[NSForegroundColorAttributeName] as? UIColor {
                btn.setTitleColor(color, for: state)
            }
            if let shadowColor = attributes[NSShadowAttributeName] as? UIColor {
                btn.setTitleShadowColor(shadowColor, for: state)
            }
        }
    }
}

