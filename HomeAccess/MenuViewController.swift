//
//  MenuViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/19.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate {

    var tableView: UITableView!
    
    var dataSource: DataSource!
    
    let items = ["个人设置","个人信息","权限管理","绑定设备","开关记录"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpTableView()
    }

    func setUpTableView() {
        
        dataSource = DataSource(items:items, and: MenuTableViewCell.identifier(), handler: { (cell, item) -> Void in
            let menuCell  = cell as! MenuTableViewCell
            menuCell.backgroundColor = UIColor.clearColor()
            let title = item as! String
            menuCell.titleLabel.text = title
        })

        
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(80)
            make.bottom.equalTo(self.view).offset(-80)
        }
        
        
        tableView.registerClass(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier())
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        self.slidingViewController().topViewController.view.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        
        
        //Todo: 选择要变换的视图
        
        
        
        self.slidingViewController().resetTopViewAnimated(true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let tableViewHeight = CGRectGetHeight(self.tableView.bounds)
        return ceil(tableViewHeight / CGFloat(self.items.count))
    }
}
