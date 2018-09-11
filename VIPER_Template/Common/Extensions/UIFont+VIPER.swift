//
//  UIFont.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import UIKit.UIFont

extension UIFont {
    
    open class var header: UIFont {
        return UIFont.systemFont(ofSize: 20.0, weight: .bold)
    }
    
    open class var subtitle: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .light)
    }
    
    open class var error: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }
    
    open class var buttonTitle: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .medium)
    }
}
