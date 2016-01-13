//
//  Device.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/13.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import Foundation
import RealmSwift

class Device: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    dynamic var version: String?
    dynamic var enable: Bool = false
    dynamic var memory: String?
    dynamic var active: NSDate?
    dynamic var mode: Int = 0
    dynamic var name: String?
    dynamic var gps: String?
    dynamic var function: String?
    dynamic var channel: Int = 0
    dynamic var ID: String?
    dynamic var btmac: String?
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
