//
//  User.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/13.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    dynamic var userid: String?
    dynamic var username: String?
    dynamic var phone: String?
    dynamic var password: String?
    dynamic var btkey: String?
    dynamic var nfckey: String?
    dynamic var fingerkey: String?
    dynamic var memory: String?

}
