//
//  ViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/8.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    var viewModel: ViewModel!
    
    var tableView: UITableView!
    var dataSource: DataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "开门吧"

        viewModel = ViewModel(items: ["获取服务器信息","设备列表与状态"])
        self.configureTableView()
        
    }
    
    func configureTableView() {
        
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.registerClass(MainCell.self, forCellReuseIdentifier: MainCell.identifier())
        view.addSubview(tableView)
        
        dataSource = DataSource(items: viewModel.items, and: MainCell.identifier(), handler: { (needCastCell, item) -> Void in
            let cell = needCastCell as? MainCell
            if let _ = cell {
                
                let title = item as? String
                cell!.titleLabel.text = title;
//                cell!.contentLabel.text = dic?.keys.first;
            }
        })
        
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
//        let item = self.dataSource.itemForIndexPath(indexPath)
        
        
        if indexPath.row == 0 {
            
            let serverInfoVC = ServerInfoViewController.initialFromStoryBoard() as! ServerInfoViewController
            self.navigationController?.showViewController(serverInfoVC, sender: self)

        } else if indexPath.row == 1 {
            let devicelistVC = DeviceListViewController.initialFromStoryBoard() as! DeviceListViewController
            self.navigationController?.showViewController(devicelistVC, sender: self)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController {
    class func initialFromStoryBoard() -> UIViewController{
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier(String(self)) as UIViewController
        
        return vc
    }
}

