//
//  DeviceListShema.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class DeviceListShema: NSObject {
    
    var ID: String?
    var name: String?
    var enable: Bool = false
    var function: String?
    var channel: Int = 0
    var active: NSDate?
    var GPS: String?
    var mode: Int = 0
    var version: String?
    var memory: String?
    var bluetoothMAC: String?
}
