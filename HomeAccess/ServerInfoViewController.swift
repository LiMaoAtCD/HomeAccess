//
//  ServerInfoViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class ServerInfoViewController: UIViewController {

    let viewModel: ServerInfoViewModel = ServerInfoViewModel()
    var versionLabel: UILabel!
    var outOfDateLabel: UILabel!
    var urlLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "服务器信息"
        configureStatusViews()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchServerInfo { (success) -> Void in
            if success {
                self.updateInfo()
            }
        }
    }
    
    func updateInfo() {
        versionLabel.text = "Version: " + viewModel.dataFrame.version
        outOfDateLabel.text = "过期时间: " + "\(viewModel.dataFrame.day)"
        urlLabel.text = "新服务器地址: " + viewModel.dataFrame.url
    }
    
    func configureStatusViews(){
        versionLabel = UILabel()
        self.view.addSubview(versionLabel)
        
        versionLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.snp_centerX)
            make.centerY.equalTo(view.snp_centerY).offset(-50)
        }
        
        outOfDateLabel = UILabel()
        self.view.addSubview(outOfDateLabel)
        outOfDateLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.snp_centerX)
            make.centerY.equalTo(view.snp_centerY).offset(0)
        }

        
        urlLabel = UILabel()
        self.view.addSubview(urlLabel)
        
        urlLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.snp_centerX)
            make.centerY.equalTo(view.snp_centerY).offset(50)
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
