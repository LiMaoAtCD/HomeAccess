//
//  RecordViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/20.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, UITableViewDelegate {

    let viewModel = RecordViewModel()
    
    var tableView: UITableView!
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "开门记录"
        
        viewModel.items = [["time":"12:00:00", "name": "润兰花园"]]

        setUpViews()
        
    }


    func setUpViews(){
        dataSource = DataSource(items: viewModel.items, and: RecordCell.identifier(), handler: { (cell, item) -> Void in
            
            let dic = item as! [String: String]
            let c = cell as! RecordCell
            c.timeLabel.text = dic["time"]
            c.deviceLabel.text = dic["name"]
        })
        
        tableView = UITableView(frame: self.view.bounds, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = dataSource
        self.view.addSubview(tableView)
        
        tableView.registerClass(RecordCell.self, forCellReuseIdentifier: RecordCell.identifier())
        tableView.tableFooterView = UIView()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
