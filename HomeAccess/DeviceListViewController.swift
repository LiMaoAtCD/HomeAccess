//
//  DeviceListViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class DeviceListViewController: UIViewController, UITableViewDelegate {

    var viewModel: DeviceListViewModel!
    
    var tableView: UITableView!
    var dataSource: DataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        viewModel = DeviceListViewModel()
        configureViews()
        
        viewModel.fetchDeviceList { (success) -> Void in
            if success {
                self.dataSource.items = self.viewModel.devices
                self.tableView.reloadData()
            } else{
                
            }
        }

    }
    
    func configureViews() {
        
        dataSource = DataSource(items: viewModel.devices, and: DeviceCell.identifier(), handler: { (devicecell, item) -> Void in
            let cell = devicecell as! DeviceCell
            let device = item as! Device
            cell.nameLabel.text = device.name
            
        })
        
        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = dataSource
        
        self.view.addSubview(tableView)

        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view.snp_edges)
        }
        
        tableView.registerClass(DeviceCell.self, forCellReuseIdentifier: DeviceCell.identifier())
        tableView.tableFooterView = UIView()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let vc = DeviceDetailViewController.initialFromStoryBoard() as! DeviceDetailViewController
        let device = dataSource.itemForIndexPath(indexPath) as! Device
        vc.device = device
        
        self.navigationController?.showViewController(vc, sender: self)
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
