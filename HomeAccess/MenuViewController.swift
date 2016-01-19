//
//  MenuViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/19.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpTableView()
        self.view.backgroundColor = UIColor.redColor()
    }

    func setUpTableView() {
        
        dataSource = DataSource(items: ["个人设置"], and: MenuTableViewCell.identifier(), handler: { (cell, item) -> Void in
            
        })

        tableView.registerClass(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier())
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
