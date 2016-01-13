//
//  DeviceListViewModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import RealmSwift
import PKHUD
class DeviceListViewModel: NSObject {
    var devices:[Device]? = [Device]()
    func fetchDeviceList(success:successBlock) {
        
        NetworkManager.GetDeviceList { (json, error) -> Void in
            if let _ = error {
                
            } else{
                let arrayValue = json?.arrayValue
                
                if let arr = arrayValue {
                    let realm = try! Realm()

                    for obj in arr {
                        let device = Device()
                        device.version = obj["VER"].stringValue
                        device.enable = obj["ENABLE"].boolValue
                        device.memory = obj["MEMORY"].stringValue
                        let dateFormatter = NSDateFormatter()
                        device.active = dateFormatter.dateFromString(obj["ACTIVE"].stringValue)
                        device.mode = obj["MODE"].intValue
                        device.name = obj["NAME"].stringValue
                        device.gps = obj["GPS"].stringValue
                        device.function = obj["FUNCTION"].stringValue
                        device.channel = obj["CHANNEL"].intValue
                        device.ID = obj["ID"].stringValue
                        device.btmac = obj["BTMAC"].stringValue
                        
                        
                        self.devices?.append(device)
                    }
                    
                    try! realm.write {
                        realm.add(self.devices!, update: true)
                        
                    }
                    print("device list save success")
                    PKHUD.sharedHUD.contentView = PKHUDSuccessView()
                    PKHUD.sharedHUD.show()
                    PKHUD.sharedHUD.hide(afterDelay: 2.0);
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
