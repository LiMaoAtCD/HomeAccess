//
//  ViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/8.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let label = UILabel()
        label.text = "主页"
        label.textColor = UIColor.lightGrayColor()
        self.view.addSubview(label)
        
        label.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(topLayoutGuide).offset(100)
            make.centerX.equalTo(view.snp_centerX)
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

