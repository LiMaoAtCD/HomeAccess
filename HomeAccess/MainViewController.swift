//
//  MainViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/19.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let dynamicTransition = MEDynamicTransition()
    let zoomAnimationController = MEZoomAnimationController()
    
    var communityDoorView: UIView!
    var houseView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //选择动态还是缩放
        self.dynamicTransition.slidingViewController = self.slidingViewController()
        dynamicArchorLeftMenu()
//        zoomArchorLeftMenu()
        
        
        //设置页面通知
        setUpNotifications()
        self.title = "云门"
        setUpViews()
        
    }

    //Mark: 侧滑通知
    func setUpNotifications() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "gotoSetting", name: kViewControllerFromMainVCToSetVC, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "gotoRecording", name: kViewControllerFromMainVCToRecordVC, object: nil)
    }
    
    func gotoSetting() {
        let setVC = SetViewController.initialFromStoryBoard() as! SetViewController
        self.navigationController?.pushViewController(setVC, animated: false)
    }
    
    func gotoRecording() {
        let recordVC = RecordViewController.initialFromStoryBoard() as! RecordViewController
        self.navigationController?.pushViewController(recordVC, animated: false)

    }
    
    //Mark: 左滑控制
    
    func dynamicArchorLeftMenu() {
        
        self.slidingViewController().delegate = dynamicTransition
        self.slidingViewController().topViewAnchoredGesture = [ECSlidingViewControllerAnchoredGesture.Tapping, ECSlidingViewControllerAnchoredGesture.Custom]
        self.slidingViewController().customAnchoredGestures = [self.dynamicTransitionPanGesture()]
        self.navigationController?.view.removeGestureRecognizer(self.slidingViewController().panGesture)
        self.navigationController?.view.addGestureRecognizer(self.dynamicTransitionPanGesture())
    }
    
    func zoomArchorLeftMenu() {
        
        self.slidingViewController().delegate = zoomAnimationController
        self.slidingViewController().topViewAnchoredGesture = [.Tapping,.Panning]
        self.slidingViewController().customAnchoredGestures = []
        self.navigationController?.view.removeGestureRecognizer(self.dynamicTransitionPanGesture())
        self.navigationController?.view.addGestureRecognizer(self.slidingViewController().panGesture)
    }
    
    func dynamicTransitionPanGesture() -> UIPanGestureRecognizer {
        let dynamicTransitionPanGesture = UIPanGestureRecognizer(target: self.dynamicTransition, action: "handlePanGesture:")
        return dynamicTransitionPanGesture
    }
    
    
    //Mark: 小区 & 住宅 门视图
    func setUpViews() {
        
        let leftNavigationItem = UIButton(type: .Custom)
        
        leftNavigationItem.setTitle("菜单", forState: .Normal)
        leftNavigationItem.setTitleColor(UIColor.blackColor(), forState: .Normal)
        leftNavigationItem.addTarget(self, action: "openLeftMenuView:", forControlEvents: .TouchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftNavigationItem)
        
        let rightNavigationItem = UIButton(type: .Custom)
        
        rightNavigationItem.setTitle("公告", forState: .Normal)
        rightNavigationItem.setTitleColor(UIColor.blackColor(), forState: .Normal)
        rightNavigationItem.addTarget(self, action: "openRightMenuView:", forControlEvents: .TouchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: rightNavigationItem)
        
    
        
        
        //小区
        communityDoorView = UIView()
        communityDoorView.backgroundColor = UIColor.yellowColor()
        view.addSubview(communityDoorView)
        
        communityDoorView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view.snp_left).offset(20)
            make.right.equalTo(view.snp_right).offset(-20)
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(20)
            make.height.equalTo((kScreenHeight - self.topLayoutGuide.length) / 2 - 60)
        }
        
        let communityLabel = UILabel()
        communityLabel.text = "小区"
        communityLabel.textColor = UIColor.blackColor()
        communityLabel.textAlignment = NSTextAlignment.Center
        communityLabel.font = UIFont.systemFontOfSize(30.0)
        
        
        communityDoorView.addSubview(communityLabel)
        
        communityLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(communityDoorView)
            make.centerY.equalTo(communityDoorView)
        }
        
        houseView = UIView()
        houseView.backgroundColor = UIColor.orangeColor()
        view.addSubview(houseView)
        
        houseView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(communityDoorView)
            make.right.equalTo(communityDoorView)
            make.bottom.equalTo(view.snp_bottom).offset(-20)
            make.top.equalTo(communityDoorView.snp_bottom).offset(20)
        }
        
        let houseLabel = UILabel()
        houseLabel.text = "住宅"
        houseLabel.textColor = UIColor.blackColor()
        houseLabel.textAlignment = NSTextAlignment.Center
        houseLabel.font = UIFont.systemFontOfSize(30.0)
        
        
        houseView.addSubview(houseLabel)
        
        houseLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(houseView)
            make.centerY.equalTo(houseView)
        }

    }
    
    func openLeftMenuView(button: UIButton){
        
    }
    
    func openRightMenuView(button: UIButton) {
        
        let notifiesView = NotifiesNavigationController.initialFromStoryBoard() as!  NotifiesNavigationController
        
        self.showDetailViewController(notifiesView, sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
}
