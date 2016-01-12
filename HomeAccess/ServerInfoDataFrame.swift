//
//  ServerInfoDataFrame.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class ServerInfoDataFrame: NSObject {
    
    var version: String = ""
    var day: Int = -1
    var url: String = ""
    
    init(version: String, day: Int, url: String){
        self.version = version
        self.day = day
        self.url = url
    }
    
}
