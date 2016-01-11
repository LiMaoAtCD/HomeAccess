//
//  ViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/8.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deviceModel: ViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "开门吧"

        deviceModel = ViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

