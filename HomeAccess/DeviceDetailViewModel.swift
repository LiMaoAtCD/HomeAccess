//
//  DeviceDetailViewModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/13.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class DeviceDetailViewModel: NSObject {
    
    var device: Device!

    
    
    func openDoor(success: completionHandler) {
        NetworkManager.Open(device.ID!, channel: device.channel, user: "11111", message: "welcome", mode: "0") { (json, error) -> Void in
            print("\(json)")
            
            if let data = json {
                
                let result = data[0]["RESULT"].intValue
                if result == 0 {
                    success(true)
                }
            }
            
        }
    }
}
