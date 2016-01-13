//
//  UserInfoViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/13.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import SnapKit
class UserInfoViewController: UIViewController {

    let viewModel = UserInfoViewModel()
    
    var addUserButton: UIButton!
    var deleteUserButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "用户信息"
        configureViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureViews() {
    
        self.addUserButton = UIButton(type: .Custom)
        self.addUserButton.setTitle("增加用户", forState: .Normal)
        self.addUserButton.addTarget(self, action: "addOrUpdateUserInfo", forControlEvents: .TouchUpInside)
        
        self.addUserButton.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.addUserButton)
        
        addUserButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view.snp_leftMargin).offset(10)
            make.bottom.equalTo(view.snp_bottomMargin).offset(-20)
            make.height.equalTo(45)
            make.right.equalTo(view.snp_centerX).offset(-10)
        }
        
        self.deleteUserButton = UIButton(type: .Custom)
        self.deleteUserButton.setTitle("删除用户", forState: .Normal)
        self.deleteUserButton.addTarget(self, action: "deleteUser", forControlEvents: .TouchUpInside)
        self.deleteUserButton.backgroundColor = UIColor.orangeColor()

        self.view.addSubview(self.deleteUserButton)
        
        deleteUserButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view.snp_centerX).offset(10)
            make.right.equalTo(view.snp_rightMargin).offset(-10)
            make.height.equalTo(addUserButton)
            make.bottom.equalTo(addUserButton)
        }
    
    }
    
    
    func addOrUpdateUserInfo() {
        self.viewModel.addUser { (success) -> Void in
            if success {
                
            } else {
                
            }
        }
    }
    
    func deleteUser(userid: String) {
        self.viewModel.deleteUser("userid") { (success) -> Void in
            
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

}
