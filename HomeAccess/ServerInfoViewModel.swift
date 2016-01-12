//
//  ServerInfoViewModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import SwiftyJSON
class ServerInfoViewModel: NSObject {
    
    var dataFrame: ServerInfoDataFrame = ServerInfoDataFrame(version: "", day: -1, url: "")
    func fetchServerInfo(success: successBlock) {
        NetworkManager.fetchServerStatus { (result, error) -> Void in
            if let _ = error {
                success(false)
            } else{
                
                if let data = result {
                    self.dataFrame.version = data[0]["VER"].stringValue
                    self.dataFrame.day = data[0]["DAY"].intValue
                    self.dataFrame.url = data[0]["URL"].stringValue
                    success(true)
                }
                
//                
//                if let data = result {
//                    let dic = data as? [String: AnyObject]
//                    if let _ = dic {
//                        self.dataFrame.version = dic?["VER"] as! String
//                        self.dataFrame.url = dic!["URL"] as! String
//                        self.dataFrame.day = dic?["DAY"] as! Int
//                        
//                    }
//                }

            }
            
        }
    }
    
}
