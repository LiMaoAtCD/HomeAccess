//
//  LoginViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/8.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var viewmodel: LoginViewModel! = LoginViewModel()
    
    var cellphoneNumberTextField: UITextField!
    var passwordTextField: UITextField!
    var forgetPasswordButton: UIButton!
    var registerButton: UIButton!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        
        self.view.backgroundColor = UIColor.blueColor()
    }
    
    //MARK: 配置视图
    private func setUpViews(){

        setUpPhoneNumberTextField()
        setUpPasswordTextField()
        setUpForgetButton()
        setUpRegisterButton()
        setUpLoginButton()
    }
    
    private func setUpPhoneNumberTextField() {
        
        cellphoneNumberTextField = UITextField()
        cellphoneNumberTextField.delegate = self
        cellphoneNumberTextField.addTarget(self, action: "cellphoneTextFieldEditingChanged", forControlEvents: UIControlEvents.EditingChanged)
        cellphoneNumberTextField.placeholder = "手机号"
        view.addSubview(cellphoneNumberTextField)
        
        
        cellphoneNumberTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view.snp_left).offset(50)
            make.right.equalTo(view.snp_left).offset(-50)
            make.height.equalTo(40)
            make.centerY.equalTo(view.snp_centerY).multipliedBy(0.5)
        }
    }
    
    private func setUpPasswordTextField() {
        
        passwordTextField = UITextField()
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: "passwordTextFieldEditingChanged", forControlEvents: UIControlEvents.EditingChanged)
        passwordTextField.placeholder = "密码"

        view.addSubview(passwordTextField)
        
        passwordTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(cellphoneNumberTextField)
            make.right.equalTo(cellphoneNumberTextField)
            make.height.equalTo(cellphoneNumberTextField)
            make.centerY.equalTo(cellphoneNumberTextField.snp_bottom).offset(20)
        }
    }
    
    private func setUpForgetButton() {
        
        forgetPasswordButton = UIButton()
        forgetPasswordButton.setTitle("忘记密码?", forState: UIControlState.Normal)
        forgetPasswordButton.setTitle("忘记密码?", forState: .Highlighted)
        forgetPasswordButton.addTarget(self, action: "forgetPassword:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(forgetPasswordButton)
        
        forgetPasswordButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(cellphoneNumberTextField.snp_right)
            make.height.equalTo(40)
            make.width.equalTo(200)
            make.top.equalTo(passwordTextField.snp_bottom).offset(20)
        }
    }
    
    private func setUpRegisterButton() {
        
        registerButton = UIButton()
        registerButton.setTitle("注册", forState: UIControlState.Normal)
        registerButton.setTitle("注册", forState: .Highlighted)
        registerButton.addTarget(self, action: "register:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(registerButton)
        
        registerButton.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(view.snp_bottom).offset(-30)
            make.width.equalTo(80)
            make.leading.equalTo(view.snp_leading).offset(20)
            make.height.equalTo(45)
        }
    }
    
    private func setUpLoginButton() {
        registerButton = UIButton()
        registerButton.setTitle("登录", forState: UIControlState.Normal)
        registerButton.setTitle("登录", forState: .Highlighted)
        registerButton.addTarget(self, action: "login:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(registerButton)
        
        let loginButton = UIButton(type: .Custom)
        loginButton.setTitle("登录", forState: UIControlState.Normal)
        loginButton.addTarget(self, action: "login", forControlEvents: .TouchUpInside)
        view.addSubview(loginButton)
        loginButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(45)
            make.centerY.equalTo(view.snp_centerY).offset(1.5)
            make.centerX.equalTo(view.snp_centerX)
        }
    }

  
//    MARK: 点击事件处理
    private func login(){
        viewmodel.login { (success) -> Void in
            if success {
//                UserCenter.setLogin(true)
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
