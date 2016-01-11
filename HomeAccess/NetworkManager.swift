//
//  NetworkManager.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/11.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
//let URLString = "http://120.24.208.181:89/gw.aspx"
let URLString = "http://www.7wang523.com/teeth-api/auth/token"

typealias CompletionHandler = ([String : AnyObject]?, NSError?) -> Void

class NetworkManager: NSObject {
    
//    请求设备列表与获取设备状态
    class func fetchDeviceListAndStatus(){
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"GetDeviceList","DATA":""], encoding: .URL, headers: nil).responseJSON { (response) -> Void in
            print("\(response)")
        }
    }
    
    class func test() {
        Alamofire.request(.POST, URLString, parameters: ["username":"18900000000","password":"111111"], encoding: .URL, headers: nil).responseJSON { response in
                print("Response JSON: \(response.result.value)")
            if let value = response.result.value {
                let json = JSON(value)
                print("\(json)")
            } else{
                let error = response.result.error
                print("error: \(error)")
            }
        }
    }
    
    class func login(username: String, password: String , completionHandler:CompletionHandler)  {
        Alamofire.request(.POST, URLString, parameters: ["username": username,"password":password], encoding: .URL, headers: nil).responseJSON { response in
            print("Response JSON: \(response.result.value)")
            if let value = response.result.value {
//                let json = JSON(value)
//                let dic = json.dictionaryObject
                completionHandler(value as? [String : AnyObject], nil)
            } else{
                let error = response.result.error
                completionHandler(nil, error)

            }
        }
    }
    
}


extension NetworkManager {
//    获取服务器信息
    class func fetchServerStatus() {
        
        Alamofire.request(.POST, URLString, parameters: ["KEY":""], encoding: ParameterEncoding.URL, headers: nil).responseJSON { response in
            print("\(response)")
        }
        
    }
    
    
    
}