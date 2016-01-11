//
//  LoginViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/8.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var viewmodel: LoginViewModel! = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        configureViews()
        
    }
    
    //MARK: 配置视图
    func configureViews(){
        
        let loginButton = UIButton(type: .Custom)
        loginButton.setTitle("登录", forState: UIControlState.Normal)
        loginButton.addTarget(self, action: "login", forControlEvents: .TouchUpInside)
        view.addSubview(loginButton)
        loginButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(45)
            make.centerY.equalTo(view.snp_centerY)
            make.centerX.equalTo(view.snp_centerX)
        }
    }

  
//    MARK: 点击事件处理
    func login(){
        viewmodel.login { (success) -> Void in
            if success {
                UserCenter.setLogin(true)
                NSNotificationCenter.defaultCenter().postNotificationName(UserCenter.kSwitchFromLoginVCToMainVC(), object: nil)
            } else{
                print("login error")
            }
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
