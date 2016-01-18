//
//  RegisterViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/18.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UIGestureRecognizerDelegate {

    let viewModel = RegisterViewModel()
    
    var cellphoneTextField: JVFloatLabeledTextField!
    var passwordTextField: JVFloatLabeledTextField!
    var validateCodeTextField: JVFloatLabeledTextField!
    var fetchValidateCodeButton: UIButton!
    var registerButton: UIButton!
    let horizontalMargin = 20.0
    
    
    var timer: NSTimer!
    var count: Int = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.fd_prefersNavigationBarHidden = false
        self.title = "注册"
        setUpViews()
    }
    
    //Mark: 设置视图
    
    func setUpViews() {
        
        setUpCellphoneTextField()
        setUpValidateTextField()
        setUpPasswordTextField()
        setUpFetchValidateCodeButton()
        setUpRegisterButton()
        
        setUpPopNavigationBarItem()
    }
    
    func setUpPopNavigationBarItem() {
        
        let pop = UIButton(type: UIButtonType.Custom)
        pop.setTitle("登录", forState: .Normal)
        pop.frame = CGRectMake(0, 0, 60, 30)
        pop.addTarget(self, action: "popViewController", forControlEvents: .TouchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: pop)
    }
    
    func setUpCloseKeyboardGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "closeKeyboard")
        view.addGestureRecognizer(tapGesture)
    }
    
    func setUpCellphoneTextField() {
        
        cellphoneTextField = JVFloatLabeledTextField()
        cellphoneTextField.backgroundColor = UIColor.redColor()
        cellphoneTextField.placeholder = "手机号码"
        cellphoneTextField.keyboardType = .NumberPad
        cellphoneTextField.addTarget(self, action: "textFieldDidEdited:", forControlEvents: .EditingChanged)
        view.addSubview(cellphoneTextField)
        
        cellphoneTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view.snp_left).offset(horizontalMargin)
            make.right.equalTo(view.snp_right).offset(-horizontalMargin)
            make.height.equalTo(35)
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(20)
        }
        
    }
    
    func setUpValidateTextField() {
        
        validateCodeTextField = JVFloatLabeledTextField()
        validateCodeTextField.placeholder = "验证码"
        validateCodeTextField.keyboardType = .NumberPad
        validateCodeTextField.addTarget(self, action: "textFieldDidEdited:", forControlEvents: .EditingChanged)
        validateCodeTextField.backgroundColor = UIColor.redColor()

        view.addSubview(validateCodeTextField)
        
        
        validateCodeTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(cellphoneTextField.snp_left)
            make.right.equalTo(cellphoneTextField.snp_right).offset(-100)
            make.height.equalTo(cellphoneTextField.snp_height)
            make.top.equalTo(cellphoneTextField.snp_bottom).offset(10)
        }
    }
 
    func setUpPasswordTextField() {
        
        passwordTextField = JVFloatLabeledTextField()
        passwordTextField.placeholder = "密码"
        passwordTextField.backgroundColor = UIColor.redColor()

        passwordTextField.secureTextEntry = true
        passwordTextField.addTarget(self, action: "textFieldDidEdited:", forControlEvents: .EditingChanged)
        
        view.addSubview(passwordTextField)
        
        passwordTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(cellphoneTextField)
            make.right.equalTo(cellphoneTextField)
            make.height.equalTo(cellphoneTextField)
            make.top.equalTo(validateCodeTextField.snp_bottom).offset(10)
        }

    }
    
    func setUpFetchValidateCodeButton() {
        fetchValidateCodeButton = UIButton.init(type: .Custom)
        fetchValidateCodeButton.setTitle("获取验证码", forState: .Normal)
        fetchValidateCodeButton.addTarget(self, action: "fetchValidateCode", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(fetchValidateCodeButton)
        
        fetchValidateCodeButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(validateCodeTextField.snp_right).offset(8)
            make.right.equalTo(cellphoneTextField.snp_right)
            make.height.equalTo(validateCodeTextField)
            make.centerY.equalTo(validateCodeTextField.snp_centerY)
        }
    }

    
    func setUpRegisterButton() {
        
        registerButton = UIButton.init(type: UIButtonType.Custom)
        registerButton.addTarget(self, action: "register", forControlEvents: UIControlEvents.TouchUpInside)
        registerButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        registerButton.setTitle("注册", forState: .Normal)
        registerButton.setTitle("注册", forState: .Highlighted)


        view.addSubview(registerButton)
        
        registerButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalTo(view.snp_centerX)
            make.centerY.equalTo(view.snp_centerY)
        }
    }
    
    //MARK: 事件处理
    
    func closeKeyboard() {
        for subview in view.subviews {
            if subview is UITextField {
                subview.resignFirstResponder()
            }
        }
    }
    
    func textFieldDidEdited(textField: UITextField) {
        
        if textField == cellphoneTextField {
            viewModel.phonenumber = textField.text
        } else if textField == validateCodeTextField {
            viewModel.validateCode = textField.text
        } else {
            viewModel.password = textField.text
        }
        
    }
    
    func fetchValidateCode() {
        // 手机号合法性
        
        guard let number = viewModel.phonenumber else{
            //提示咩有输入手机号
            
            
            return
        }
        
        if Utility.isValidPassword(number) {
            //下一步，获取验证码，timer倒计时
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerCount", userInfo: nil, repeats: true)
            timer.fire()
        } else {
            //提示手机号不合法
        }
        
    }
    
    func timerCount(){
        count--
        if count <= 0 {
            self.fetchValidateCodeButton.setTitle("重新获取", forState: .Normal)
            self.fetchValidateCodeButton.userInteractionEnabled = true
        }
        
        self.fetchValidateCodeButton.setTitle("\(count)s", forState: .Normal)
        self.fetchValidateCodeButton.userInteractionEnabled = false
        
    }
    
    func popViewController() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
