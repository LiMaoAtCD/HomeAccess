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
    
    let items = ["个人信息","个人信息","权限管理","绑定设备","开关记录"]

    var exitButton: UIButton!
    
    var mainNavigationVC: MainPageNavigationController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpBackImage()
        setUpTableView()
        setUpExitView()
        
        mainNavigationVC = self.slidingViewController().topViewController as!MainPageNavigationController
    }
    
    func setUpBackImage() {
        let image = UIImage(named: "Beach")
        let imageview = UIImageView(image: image)
        
        self.view.addSubview(imageview)
        imageview.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
    }
    
    func setUpExitView() {
        exitButton = UIButton(type: .Custom)
        exitButton.setTitle("登出", forState: .Normal)
        exitButton.backgroundColor = UIColor.clearColor()
        exitButton.addTarget(self, action: "exit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(exitButton)
        
        exitButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view.snp_left).offset(20)
            make.width.equalTo(50)
            make.height.equalTo(35)
            make.bottom.equalTo(-20)
        }
    }

    func setUpTableView() {
        
        dataSource = DataSource(items:items, and: MenuTableViewCell.identifier(), handler: { (cell, item) -> Void in
            let menuCell  = cell as! MenuTableViewCell
            menuCell.backgroundColor = UIColor.clearColor()
            let title = item as! String
            menuCell.titleLabel.text = title
        })

        
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.scrollEnabled = false
        tableView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(80)
            make.bottom.equalTo(self.view).offset(-80)
        }
        
        
        tableView.registerClass(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier())
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Mark: 选择视图
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.slidingViewController().topViewController.view.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        
        switch indexPath.row {
        case 0:
            NSNotificationCenter.defaultCenter().postNotificationName(kViewControllerFromMainVCToSetVC, object: nil)
        case 1:
            NSNotificationCenter.defaultCenter().postNotificationName(kViewControllerFromMainVCToRecordVC, object: nil)
        case 2:
            NSNotificationCenter.defaultCenter().postNotificationName(kViewControllerFromMainVCToRecordVC, object: nil)
        case 3:
            NSNotificationCenter.defaultCenter().postNotificationName(kViewControllerFromMainVCToRecordVC, object: nil)
        case 4:
            NSNotificationCenter.defaultCenter().postNotificationName(kViewControllerFromMainVCToRecordVC, object: nil)
        default:
            self.slidingViewController().topViewController = self.mainNavigationVC
        }
        
        
        
        //Todo: 选择要变换的视图
        self.slidingViewController().resetTopViewAnimated(true)
    }
    
    func exit(button: UIButton) {
        self.slidingViewController().resetTopViewAnimated(true)
        UserCenter.setLogin(false)
        NSNotificationCenter.defaultCenter().postNotificationName(kViewControlerFromMainToLogin, object: nil)
    }
    
    //MARK: Cell高度设定
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let tableViewHeight = CGRectGetHeight(self.tableView.bounds)
        return ceil(tableViewHeight / CGFloat(self.items.count))
    }

    
    
}
