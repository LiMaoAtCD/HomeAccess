//
//  DeviceListViewModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class DeviceListViewModel: NSObject {
    var devicelist:[DeviceListShema]? = [DeviceListShema]()
    func fetchDeviceList(success:successBlock) {
        
        NetworkManager.fetchDeviceListAndStatus { (json, error) -> Void in
            if let _ = error {
                
            } else{
                let arrayValue = json?.arrayValue
                
                if let arr = arrayValue {
                    for obj in arr {
                        
                        let device = DeviceListShema()
                        device.version = obj["VER"].stringValue
                        device.enable = obj["ENABLE"].boolValue
                        device.memory = obj["MEMORY"].stringValue
                        
                        let dateFormatter = NSDateFormatter()
                        device.active = dateFormatter.dateFromString(obj["ACTIVE"].stringValue)
                        device.mode = obj["MODE"].intValue
                        device.name = obj["NAME"].stringValue
                        device.GPS = obj["GPS"].stringValue
                        device.function = obj["FUNCTION"].stringValue
                        device.channel = obj["CHANNEL"].intValue
                        device.ID = obj["ID"].stringValue
                        device.bluetoothMAC = obj["BTMAC"].stringValue
                        
                        self.devicelist?.append(device)
                    }
                }
                success(true)
                
            }
        }
    }
}
//    {
//    "ID": "ttttt"
//    "NAME": "测试机1"
//    "ENABLE": 1
//    "FUNCTION": "11111111111111"
//    "CHANNEL": 1
//    "ACTIVE": "2015-12-04 12:13:14"
//    "GPS": "130,24"
//    "MODE": 0
//    "VER": "0.99"
//    "MEMORY": "测试机"
//    "BTMAC": "00:15:83:00:42:E9"
//    }
