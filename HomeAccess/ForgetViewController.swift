//
//  ForgetViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/18.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class ForgetViewController: UIViewController {

    var viewModel: ForgetViewModel = ForgetViewModel()
    var phoneTextField: JVFloatLabeledTextField!
    var validateCodeTextField: JVFloatLabeledTextField!
    var passwordTextField: JVFloatLabeledTextField!
    var confirmTextField: JVFloatLabeledTextField!

    var validateButton: UIButton!
    var modifyButton: UIButton!
    
    let horizontalMargin = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "忘记密码"
        setupViews()
        self.view.backgroundColor = UIColor.brownColor()
        
    }
    //Mark : 子视图
    func setupViews() {
        setUpPhoneTextField()
        setUpValidateTextField()
        setUpPasswordTextField()
        setUpvalidButton()
        setUpConfirmTextField()
    }
    
    func setUpPhoneTextField() {
        
        phoneTextField = JVFloatLabeledTextField()
        self.view.addSubview(phoneTextField)
        phoneTextField.placeholder = "手机号码"
        phoneTextField.addTarget(self, action: "textfieldDidEditingChanged:", forControlEvents: .EditingChanged)
        
        phoneTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view.snp_left).offset(horizontalMargin)
            make.right.equalTo(view.snp_right).offset(-horizontalMargin)
            make.height.equalTo(35)
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(20)
        }
    }
    
    func setUpValidateTextField() {
        
        validateCodeTextField = JVFloatLabeledTextField()
        self.view.addSubview(validateCodeTextField)
        validateCodeTextField.placeholder = "验证码"

        validateCodeTextField.addTarget(self, action: "textfieldDidEditingChanged:", forControlEvents: .EditingChanged)

        validateCodeTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(phoneTextField)
            make.right.equalTo(phoneTextField).offset(-100)
            make.height.equalTo(35)
            make.top.equalTo(phoneTextField.snp_bottom).offset(20)
        }
    }
    
    func setUpvalidButton() {
        
        validateButton = UIButton(type: .Custom)
        self.view.addSubview(validateButton)
        
        validateButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.validateCodeTextField.snp_right).offset(10)
            make.right.equalTo(self.view.snp_right).offset(-10)
            make.height.equalTo(validateCodeTextField)
            make.centerY.equalTo(validateCodeTextField.snp_centerY)
        }
    }
    
    func setUpPasswordTextField() {
        
        passwordTextField = JVFloatLabeledTextField()
        self.view.addSubview(passwordTextField)
        passwordTextField.placeholder = "密码"

        passwordTextField.addTarget(self, action: "textfieldDidEditingChanged:", forControlEvents: .EditingChanged)
        
        passwordTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(phoneTextField)
            make.right.equalTo(phoneTextField)
            make.height.equalTo(phoneTextField.snp_height)
            make.top.equalTo(validateCodeTextField.snp_bottom).offset(20)
        }
    }
    
    func setUpConfirmTextField() {
        
        confirmTextField = JVFloatLabeledTextField()
        confirmTextField.placeholder = "重复密码"

        self.view.addSubview(confirmTextField)
        
        confirmTextField.addTarget(self, action: "textfieldDidEditingChanged:", forControlEvents: .EditingChanged)
        
        confirmTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(phoneTextField)
            make.right.equalTo(phoneTextField)
            make.height.equalTo(phoneTextField.snp_height)
            make.top.equalTo(passwordTextField.snp_bottom).offset(20)
        }
    }
    
    func textfieldDidEditingChanged(textfield: UITextField) {
        
        if textfield == phoneTextField {
            viewModel.phoneNumber = textfield.text
        } else if textfield == validateCodeTextField {
            viewModel.validateCode = textfield.text
        } else if textfield == passwordTextField {
            viewModel.password = textfield.text
        } else {
            viewModel.confirmPassword = textfield.text
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
