//
//  IASNavigationViewController.swift
//  Pods
//
//  Created by Nikolay Shubenkov on 01/06/2017.
//
//

import UIKit

open class IASNavigationController: UINavigationController {
    
    open var navigationBarAttributes = [NavigationBarAttribute]()
    
    public init(rootViewController: UIViewController, attributes:[NavigationBarAttribute]) {
        super.init(rootViewController: rootViewController)
        self.navigationBarAttributes = attributes
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
}

extension IASNavigationController: UINavigationControllerDelegate {
    open func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if navigationController == self {
            apply(attribute: navigationBarAttributes,
                  to: viewController)
        }
    }
    
    
    private func apply(attribute:[NavigationBarAttribute], to viewController:UIViewController){
        if let vc = viewController as? NavigationBarCustomizer,
            let attributes = vc.navigationBarAttributes {
            vc.apply(attributes:attributes)
            return
        }
        viewController.apply(attributes: navigationBarAttributes)
    }
    
}
