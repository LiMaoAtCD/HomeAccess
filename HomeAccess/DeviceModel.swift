//
//  DeviceModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/11.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class DeviceModel: NSObject {
    
    func fetchServerStatus() {
        NetworkManager.fetchServerStatus()
    }
    
    func fetchDeviceListAndStatus() {
        NetworkManager.fetchDeviceListAndStatus()
    }
}
