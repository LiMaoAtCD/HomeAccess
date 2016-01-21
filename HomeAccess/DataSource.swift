//
//  DataSource.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

typealias CellHandler = (UITableViewCell , AnyObject) -> Void
class DataSource: NSObject, UITableViewDataSource {

    var items: [AnyObject]?
    var identifier: String!
    var handler: CellHandler?
    
    init(items: [AnyObject]?, and identifier: String, handler: CellHandler) {
        self.items = items
        self.identifier = identifier
        self.handler = handler
        super.init()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let its = items else{
            return 0
        }
        return its.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(self.identifier, forIndexPath: indexPath)
        if let _ = handler {
            handler!(cell, self.itemForIndexPath(indexPath))
        }
        
        return cell
    }
    
    func itemForIndexPath(indexPath: NSIndexPath) -> AnyObject {
        return self.items![indexPath.row]
    }
}

extension UITableViewCell{
    class func identifier() -> String {
        return self.description()
    }
}

