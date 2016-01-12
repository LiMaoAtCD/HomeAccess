//
//  ViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/8.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: ViewModel!
    
    var tableView: UITableView!
    var dataSource: DataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "开门吧"

        let dic = ["A":"B"]
        viewModel = ViewModel(items: [dic])
        self.configureTableView()
        
    }
    
    func configureTableView() {
        
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.registerClass(MainCell.self, forCellReuseIdentifier: MainCell.identifier())
        view.addSubview(tableView)
        
        dataSource = DataSource(items: viewModel.items, and: MainCell.identifier(), handler: { (needCastCell, item) -> Void in
            let cell = needCastCell as? MainCell
            if let _ = cell {
                
                let dic = item as? [String: String]
                
                
                cell!.titleLabel.text = dic!["A"];
                cell!.contentLabel.text = dic?.keys.first;
            }
        })
        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

