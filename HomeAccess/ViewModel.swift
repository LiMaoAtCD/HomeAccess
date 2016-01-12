//
//  ViewModel.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/11.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    var items:[AnyObject]! = {
        let items = [AnyObject]()
        return items
    }()
    
    init(items: [AnyObject]?) {
        self.items = items
    }
    
    func fetchServerStatus() {
        NetworkManager.fetchServerStatus()
    }
    
    func fetchDeviceListAndStatus() {
        NetworkManager.fetchDeviceListAndStatus()
    }
    
   
}
