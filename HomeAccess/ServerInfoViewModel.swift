//
//  ServerInfoViewModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import SwiftyJSON
import PKHUD

class ServerInfoViewModel: NSObject {
    
    var dataFrame: ServerInfoDataFrame = ServerInfoDataFrame(version: "", day: -1, url: "")
    func fetchServerInfo(success: successBlock) {
        
        PKHUD.sharedHUD.contentView = PKHUDStatusView(title: "获取服务器信息", subtitle: nil, image: nil)
        PKHUD.sharedHUD.show()
        
        NetworkManager.INFO { (result, error) -> Void in
            if let _ = error {
                success(false)
                PKHUD.sharedHUD.contentView = PKHUDErrorView(title: "未知错误")
                PKHUD.sharedHUD.show()
                PKHUD.sharedHUD.hide(afterDelay: 1.0)
                
            } else{
                PKHUD.sharedHUD.contentView = PKHUDSuccessView()
                PKHUD.sharedHUD.hide(afterDelay: 2.0)
                

                if let data = result {
                    self.dataFrame.version = data[0]["VER"].stringValue
                    self.dataFrame.day = data[0]["DAY"].intValue
                    self.dataFrame.url = data[0]["URL"].stringValue
                    success(true)
                }
            }
        }
    }
    
}

extension PKHUDErrorView {
}
