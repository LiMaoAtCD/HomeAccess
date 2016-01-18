//
//  Extensions.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/14.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import PKHUD
class Extensions: NSObject {

}

public extension PKHUDErrorView {
    
    public convenience init(title: String?) {
        if let _ = title {
            self.init()
            
            let selfHeight = CGRectGetHeight(self.bounds)
            let selfWidth = CGRectGetWidth(self.bounds)
            let height: CGFloat = 25.0
            
            let label = UILabel()
            label.font = UIFont.boldSystemFontOfSize(20.0)
            label.frame = CGRectMake(0, selfHeight - height, selfWidth, height)
            
            label.textAlignment = NSTextAlignment.Center
            label.text = title
            label.textColor = UIColor.blackColor()
            self.addSubview(label)
            
            
        } else {
            
            self.init()
        }
    }
}
