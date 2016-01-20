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
    
    var cellphoneNumberTextField: JVFloatLabeledTextField!
    var passwordTextField: JVFloatLabeledTextField!
    var forgetPasswordButton: UIButton!
    var registerButton: UIButton!
    var loginButton: UIButton!
    
    let horizontalMargin = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fd_prefersNavigationBarHidden = true
        setUpViews()
        
    }
    
    //MARK: 配置视图
    private func setUpViews(){

        setUpPhoneNumberTextField()
        setUpPasswordTextField()
        setUpForgetButton()
        setUpRegisterButton()
        setUpLoginButton()
        
        setUpGesture()
    }
    
    private func setUpGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "closeKeyboard")
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func setUpPhoneNumberTextField() {
        
        cellphoneNumberTextField = JVFloatLabeledTextField()
        cellphoneNumberTextField.delegate = self
        cellphoneNumberTextField.keyboardType = UIKeyboardType.NumberPad
        cellphoneNumberTextField.addTarget(self, action: "cellphoneTextFieldEditingChanged:", forControlEvents: UIControlEvents.EditingChanged)
        cellphoneNumberTextField.placeholder = "手机号码"
        view.addSubview(cellphoneNumberTextField)
        
        
        cellphoneNumberTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view.snp_left).offset(horizontalMargin)
            make.trailing.equalTo(view.snp_trailing).offset(-horizontalMargin)
            make.height.equalTo(40)
            make.centerY.equalTo(view.snp_centerY).multipliedBy(0.5)
        }
    }
    
    private func setUpPasswordTextField() {
        
        passwordTextField = JVFloatLabeledTextField()
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: "passwordTextFieldEditingChanged:", forControlEvents: UIControlEvents.EditingChanged)
        passwordTextField.placeholder = "密码"
        passwordTextField.secureTextEntry = true
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
        forgetPasswordButton.setTitleColor(UIColor.greenColor(), forState: .Normal)
        forgetPasswordButton.setTitle("忘记密码?", forState: .Highlighted)
        forgetPasswordButton.addTarget(self, action: "forgetPassword", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(forgetPasswordButton)
        
        forgetPasswordButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(cellphoneNumberTextField.snp_right)
            make.height.equalTo(40)
            make.top.equalTo(passwordTextField.snp_bottom).offset(20)
        }
    }
    
    private func setUpRegisterButton() {
        
        registerButton = UIButton()
        registerButton.setTitle("注册", forState: UIControlState.Normal)
        registerButton.setTitle("注册", forState: .Highlighted)
        registerButton.setTitleColor(UIColor.greenColor(), forState: .Normal)

        registerButton.addTarget(self, action: "register", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(registerButton)
        
        registerButton.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(view.snp_bottom).offset(-30)
            make.width.equalTo(80)
            make.leading.equalTo(view.snp_leading).offset(20)
            make.height.equalTo(45)
        }
    }
    
    private func setUpLoginButton() {
        loginButton = UIButton()
        
        loginButton.layer.cornerRadius = 50.0
        loginButton.layer.masksToBounds = true
        loginButton.backgroundColor = UIColor.greenColor()
        loginButton.setTitle("登录", forState: UIControlState.Normal)
        loginButton.setTitle("登录", forState: .Highlighted)
        loginButton.addTarget(self, action: "login", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(loginButton)

        loginButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerY.equalTo(view.snp_centerY).offset(1.5)
            make.centerX.equalTo(view.snp_centerX)
        }
    }

  
//    MARK: 点击事件处理
    
    //
    @objc private func cellphoneTextFieldEditingChanged(textField: UITextField){
        viewmodel.username = textField.text
    }
    
    @objc private func passwordTextFieldEditingChanged(textField: UITextField) {
        viewmodel.password = textField.text
    }
    
    @objc private func register() {
        
        let registerVC = RegisterViewController.initialFromStoryBoard() as! RegisterViewController
        
        self.navigationController?.showViewController(registerVC, sender: self)
    }
    
    @objc private func forgetPassword(){
    
        let forgetPasswordVC = ForgetViewController.initialFromStoryBoard() as! ForgetViewController
        
        self.navigationController?.showViewController(forgetPasswordVC, sender: self)
    }

    @objc private func login(){
        viewmodel.login { (success) -> Void in
            if success {
                UserCenter.setLogin(true)
                NSNotificationCenter.defaultCenter().postNotificationName(kViewControlerFromLoginToMain, object: nil)
            } else{
                print("login error")
            }
        }
    }
    
    @objc private func closeKeyboard(){
        
        for subview in self.view.subviews {
            if subview is UITextField {
                subview.resignFirstResponder()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
