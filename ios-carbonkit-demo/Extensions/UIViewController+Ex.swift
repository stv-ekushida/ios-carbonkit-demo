//
//  UIViewController+Ex.swift
//  ios-carbonkit-demo
//
//  Created by Eiji Kushida on 2017/04/19.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

extension UIViewController {

    static var identifier: String {
        return String(describing: self)
    }
}
