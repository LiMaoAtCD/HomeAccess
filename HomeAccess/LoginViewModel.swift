//
//  LoginViewModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/11.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

enum LoginError: ErrorType {
    case InvalidCellphone
    case InvalidPassword
    case ResponseInvalid
}

typealias completionHandler = (Bool) -> Void

class LoginViewModel: NSObject {
    var username: String?
    var password: String?
    
    func login(success:completionHandler){
        
        //1.验证手机号密码合法性
        
        let validNumber = Utility.isMobileNumber(username)
        
//        let validePassword = Utility
        
        
        
//        NetworkManager.login("18900000000", password: "111111") { (data, error) -> Void in
//            print("data:\(data) & error: \(error)")
//            
//            if let _ = error {
//                success(false)
//            } else{
                success(true)
//            }
//        }
    }
    
    
    
}
