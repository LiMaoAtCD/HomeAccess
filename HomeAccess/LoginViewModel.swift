//
//  LoginViewModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/11.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

typealias successBlock = (Bool) -> Void
class LoginViewModel: NSObject {
    var username: String?
    var password: String?
    
    func login(success:successBlock){
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
