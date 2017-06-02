//
//  AppDelegate.swift
//  NavigationBarAppearance
//
//  Created by nikolay.shubenkov@gmail.com on 06/02/2017.
//  Copyright (c) 2017 nikolay.shubenkov@gmail.com. All rights reserved.
//

import UIKit
import NavigationBarAppearance

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupGlobalAppearance()
        window = UIWindow()
        window?.rootViewController = buildRootViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func setupGlobalAppearance(){
        let navigationBar = UINavigationBar.appearance()
        navigationBar.apply(attributes: [NavigationBarAttribute.showShadow(false),
                                         NavigationBarAttribute.backgroundColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)),
                                         NavigationBarAttribute.titleFont(UIFont.boldSystemFont(ofSize: 12)),
                                         NavigationBarAttribute.titleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))])
        
        let barButtonItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        barButtonItem.apply(attributes: [NavigationBarAttribute.barButtonTitleFont(UIFont.systemFont(ofSize: 10)),
                                         NavigationBarAttribute.barButtonTitleColor(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))])
    }
    
    func reset(){
        self.window?.rootViewController = self.buildRootViewController()
        UIView.transition(with: self.window!,
                          duration: 1,
                          options: .transitionFlipFromRight,
                          animations: {
                            self.window?.makeKeyAndVisible()
        }, completion: nil)
    }
    
    func buildRootViewController()->UIViewController {
        
        let colors = [#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)]
        
        
        //
        //          first tab
        //
        let nvc1 = IASNavigationController(rootViewController: UIViewController(),
                                           attributes:  [NavigationBarAttribute.showShadow(true),
                                                         NavigationBarAttribute.backgroundImage(#imageLiteral(resourceName: "NavigationBar")),
                                                         NavigationBarAttribute.backButton(" GoBack", #imageLiteral(resourceName: "BackButton")),
                                                         NavigationBarAttribute.titleColor(UIColor.red),
                                                         NavigationBarAttribute.titleFont(UIFont.boldSystemFont(ofSize: 20)),
                                                         NavigationBarAttribute.barButtonTitleFont(UIFont.systemFont(ofSize: 12, weight: -0.5)),
                                                         NavigationBarAttribute.barButtonTitleColor(UIColor.black)])
        
        nvc1.pushViewController(ConfigurableViewController(attributes: [NavigationBarAttribute.plainColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)),
                                                                        NavigationBarAttribute.barButtonTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))]),
                                animated: false)
        
        nvc1.pushViewController(UIViewController(), animated: false)
        
        nvc1.pushViewController(ConfigurableViewController(attributes: [NavigationBarAttribute.titleFont(UIFont.boldSystemFont(ofSize: 6))]),
                                animated: false)
        nvc1.pushViewController(UIViewController(), animated: false)
        
        
        
        //
        //          second tab
        //
        let nvc2 = IASNavigationController(rootViewController: UIViewController(),
                                           attributes: [NavigationBarAttribute.transparent,
                                                        NavigationBarAttribute.titleFont(UIFont.boldSystemFont(ofSize: 20)),
                                                        NavigationBarAttribute.titleColor(.white),
                                                        NavigationBarAttribute.barButtonTitleFont(UIFont.systemFont(ofSize: 14, weight: -0.5)),
                                                        NavigationBarAttribute.hideBackButtonTitle])
        
        nvc2.pushViewController(ConfigurableViewController(attributes: [NavigationBarAttribute.backgroundColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))]),
                                animated: false)
        
        nvc2.pushViewController(UIViewController(), animated: false)
        
        
        //
        //          third tab
        //
        let nvc3 = UINavigationController(rootViewController: UIViewController())
        nvc3.pushViewController(ConfigurableViewController(attributes: [NavigationBarAttribute.transparent,
                                                                        NavigationBarAttribute.barButtonTitleColor(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))]),
                                animated: false)
        nvc3.pushViewController(UIViewController(), animated: true)
        
        
        //Put all navigationControllers in separate tabs
        let tabbarVC = UITabBarController()
        tabbarVC.viewControllers = [nvc1,nvc2,nvc3]
        
        //add titles and random backgrounds
        tabbarVC.viewControllers?.enumerated().forEach{ nvcIndex, nvc in
            
            let navVc = nvc as! UINavigationController
            navVc.interactivePopGestureRecognizer?.isEnabled = true
            navVc.viewControllers
                .enumerated()
                .forEach{ vcIndex,vc in
                    vc.title = "tab: \(nvcIndex + 1) vc order \(vcIndex + 1)"
                    vc.view.backgroundColor = colors[Int(arc4random_uniform(UInt32(colors.count)))]
                    vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "reset",
                                                                           style: .plain,
                                                                           target: self,
                                                                           action: #selector(type(of:self).reset))
            }
        }
        
        return tabbarVC
    }

}

