//
//  UserInfoViewModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/13.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class UserInfoViewModel: NSObject {

    
    func addUser(success:completionHandler){
        let user = User()
        user.userid = "userid"
        user.username = "limao"
        user.phone = "13568927473"
        user.password = "111111"
        user.btkey = "54:4E:90:B1:7B:31"
//        user.nfckey =
        user.memory = "welcome"
        
        NetworkManager.USERINFO(user.userid!, username: user.username!, phone: user.phone!, password: user.password!, BTkey: user.btkey!,MODE: 0) { (json, error) -> Void in
            
            print("\(json) && \(error)")
            
        }
    }
    
    func deleteUser(userid: String, success: completionHandler) {
        NetworkManager.USERINFO(userid, username: nil, phone: nil, password: nil, BTkey: nil, MODE: 1) { (json, error) -> Void in
            print("\(json) && \(error)")
        }
    }
}
