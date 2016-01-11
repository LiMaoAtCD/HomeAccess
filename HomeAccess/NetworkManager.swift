//
//  NetworkManager.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/11.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import Alamofire

let URLString = "http://120.24.208.181:89/gw.aspx"

class NetworkManager: NSObject {
    
//    请求设备列表与获取设备状态
    class func fetchDeviceListAndStatus(){
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"GetDeviceList","DATA":""], encoding: .JSON, headers: nil).responseJSON { (response) -> Void in
            print("\(response)")
        }
    }
    
}


extension NetworkManager {
//    获取服务器信息
    class func fetchServerStatus() {
        
        Alamofire.request(.POST, URLString, parameters: ["KEY":""], encoding: ParameterEncoding.JSON, headers: nil).responseJSON { (response) -> Void in
            print("\(response)")
        }
        
    }
    
    
    
}