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


let URLString = "http://120.24.208.181:89/gw.aspx"
typealias CompletionHandler = (JSON?, NSError?) -> Void

class NetworkManager: NSObject {
    
    //    获取服务器信息
    class func INFO(completionhandler: CompletionHandler) {
        
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"INFO"], encoding: ParameterEncoding.URL, headers: nil).responseJSON { response in
            self.handleResponseJSON(response, completionhandler: completionhandler)
        }
    }

    //    请求设备列表与获取设备状态
    class func GetDeviceList(completionhandler: CompletionHandler){
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"GetDeviceList","DATA":""], encoding: .URL, headers: nil).responseJSON { (response) -> Void in
            self.handleResponseJSON(response, completionhandler: completionhandler)
        }
    }
    //维护用户信息
    class func USERINFO(userid: String, username: String, phone: String, password: String, BTkey: String, completionHandler:CompletionHandler) {
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"USERINFO","DATA":self.convertDictionaryToJSON(["USERID":"","USERNAME":"","PHONE":"","PASSWORD":"","BTKEY":""])], encoding: .URL, headers: nil).responseJSON { (response) -> Void in
            self.handleResponseJSON(response, completionhandler: completionHandler)
        }
    }
    
    //提交设备离线开门规则
    class func submitOfflineRole(completionHandler:CompletionHandler) {
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"OFFLINEROLE","DATA":""], encoding: .URL, headers: nil).responseJSON { (response) -> Void in
            self.handleResponseJSON(response, completionhandler: completionHandler)
        }
    }
    
    //设备远程开锁
    class func Open(completionHandler:CompletionHandler) {
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"OPEN","DATA":self.convertDictionaryToJSON(["DEVICEID":"","CHANNEL":0,"ACTIVETIME":"2012-02-21 12:00:00","USER":"","MESSAGE":"welcome","MODE":"0"])], encoding: .URL, headers: nil).responseJSON { (response) -> Void in
            self.handleResponseJSON(response, completionhandler: completionHandler)
        }
    }
    
    //设置设备状态
    class func SET(completionHandler:CompletionHandler) {
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"SET","DATA":""], encoding: .URL, headers: nil).responseJSON { (response) -> Void in
            self.handleResponseJSON(response, completionhandler: completionHandler)
        }
    }
    
    //绑定设备拥有者
    class func BIND(completionHandler:CompletionHandler) {
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"BIND","DATA":""], encoding: .URL, headers: nil).responseJSON { (response) -> Void in
            self.handleResponseJSON(response, completionhandler: completionHandler)
        }
    }
    
    //查询设备日志
    class func LOG(completionHandler:CompletionHandler) {
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"LOG","DATA":""], encoding: .URL, headers: nil).responseJSON { (response) -> Void in
            self.handleResponseJSON(response, completionhandler: completionHandler)
        }
    }

    

    
    
    
    

    
}

//MARK: 处理返回数据
extension NetworkManager {
    
    class func handleResponseJSON(response: Response<AnyObject, NSError>, completionhandler: CompletionHandler) -> Void {
        if let value = response.result.value {
            let json = JSON(value)
            completionhandler(json , nil)
        } else{
            let error = response.result.error
            completionhandler(nil, error)
        }
    }
}

extension NetworkManager {
    
    class func convertDictionaryToJSON(dic: [String:AnyObject]) -> String{
        
//        let json: NSData?
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dic, options: NSJSONWritingOptions.PrettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            
//            let jsonString = NSString(data: jsonData, encoding:)
            let jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding) as? String

            return jsonString!
        } catch let error as NSError {
            print(error)
            assert(false,"json convert error")
            return ""
        }
        

        
//        do {
//            let decoded = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? [String:String]
//            // here "decoded" is the dictionary decoded from JSON data
//        } catch let error as NSError {
//            print(error)
//        }
    }
}
