//
//  UserCenter.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/11.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

let loginKey = "loginKey"
typealias LoginCompletionHandler = Void -> Void

class UserCenter: NSObject {
    

    class func login()-> Bool {
        return NSUserDefaults.standardUserDefaults().boolForKey(loginKey)
    }
    class func setLogin(isLog: Bool) {
        
        NSUserDefaults.standardUserDefaults().setBool(isLog, forKey: loginKey)
    }

}
