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
    class func fetchServerStatus(completionhandler: CompletionHandler) {
        
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"INFO"], encoding: ParameterEncoding.URL, headers: nil).responseJSON { response in
            self.handleResponseJSON(response, completionhandler: completionhandler)
        }
    }
    
    
    //    请求设备列表与获取设备状态
    class func fetchDeviceListAndStatus(completionhandler: CompletionHandler){
        Alamofire.request(.POST, URLString, parameters: ["KEY":"","COMMAND":"GetDeviceList","DATA":""], encoding: .URL, headers: nil).responseJSON { (response) -> Void in
            self.handleResponseJSON(response, completionhandler: completionhandler)
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
