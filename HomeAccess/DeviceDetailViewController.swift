//
//  DeviceDetailViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/13.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class DeviceDetailViewController: UIViewController {

    var device: Device!
    let viewmodel = DeviceDetailViewModel()
    
    var deviceInfoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewmodel.device = device
        configureSubViews()
    }
    
    func configureSubViews() {
        
        deviceInfoLabel = UILabel()
        deviceInfoLabel.numberOfLines = 0
        deviceInfoLabel.textAlignment = NSTextAlignment.Center
        deviceInfoLabel.text = "name: " + device.name! + " channel:" + "\(device.channel)" + " ID: " + device.ID!
        self.view.addSubview(deviceInfoLabel)
        
        deviceInfoLabel.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view.snp_edges)
        }
        
        let openDoor = UIButton(type: .Custom)
        openDoor.setTitle("开此门", forState: .Normal)
        openDoor.backgroundColor = UIColor.greenColor()
        openDoor.addTarget(self, action: "opentheDoor:", forControlEvents: .TouchUpInside)
        self.view.addSubview(openDoor)
        
        openDoor.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.snp_centerX)
            make.width.equalTo(100)
            make.height.equalTo(45)
            make.bottom.equalTo(view.snp_bottom).offset(-20)
        }
        
    }
    
    func opentheDoor(button: UIButton){
        
        viewmodel.openDoor { (success) -> Void in
            if success {
                button.backgroundColor = UIColor.redColor()
                button.setTitle("门已开", forState: .Normal)
            }
        }
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
