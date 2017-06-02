//
//  UIImage+InternalExtension.swift
//  Pods
//
//  Created by Nikolay Shubenkov on 01/06/2017.
//
//

import UIKit

extension UIImage {
    
    convenience init?(name:String, classOfBundle:AnyClass){
        let bundle = Bundle(for: classOfBundle)
        self.init(named: name, in: bundle, compatibleWith: nil)
    }
    
    static func imageOf(color:UIColor)->UIImage
    {
        var alpha:CGFloat = 1
        color.getWhite(nil, alpha: &alpha)
        
        let size = CGSize(width:1,height:1)
        UIGraphicsBeginImageContextWithOptions(size, alpha == 1, 0)
        
        color.setFill()
        
        UIGraphicsGetCurrentContext()?.fill(CGRect(origin: CGPoint(),
                                                   size: size))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }    
}

